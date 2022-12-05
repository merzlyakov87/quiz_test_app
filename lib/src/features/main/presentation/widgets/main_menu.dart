import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_test/l10n/l10n.dart';
import 'package:quiz_test/src/core/ui/assets/app_assets.dart';
import 'package:quiz_test/src/features/main/data/model/quiz_category.dart';
import 'package:quiz_test/src/features/main/data/model/quiz_difficulty.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key, required this.onTap}) : super(key: key);

  final Function(QuizCategory, QuizDifficulty) onTap;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late QuizCategory currentCategory;
  late QuizDifficulty currentDifficulty;

  @override
  void initState() {
    super.initState();
    currentCategory = QuizCategory.any;
    currentDifficulty = QuizDifficulty.any;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.helloAnimation),
            DropdownButton<QuizCategory>(
                value: currentCategory,
                items: QuizCategory.values
                    .map((e) => DropdownMenuItem<QuizCategory>(
                        value: e, child: Text(e.getName(context))))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    currentCategory = value ?? currentCategory;
                  });
                }),
            DropdownButton<QuizDifficulty>(
                value: currentDifficulty,
                items: QuizDifficulty.values
                    .map((e) => DropdownMenuItem<QuizDifficulty>(
                        value: e, child: Text(e.getName(context))))
                    .toList(),
                onChanged: ((value) => setState(() {
                      currentDifficulty = value ?? currentDifficulty;
                    }))),
            ElevatedButton(
                onPressed: () {
                  widget.onTap(currentCategory, currentDifficulty);
                },
                child: Text(context.l10n.start))
          ],
        ),
      ),
    );
  }
}
