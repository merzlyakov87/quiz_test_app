import 'package:flutter/material.dart';
import 'package:quiz_test/l10n/l10n.dart';

enum QuizDifficulty { any, easy, medium, hard }

extension QuizCategoryExt on QuizDifficulty {
  String getName(BuildContext context) {
    switch (this) {
      case QuizDifficulty.any:
        return context.l10n.anyDifficulty;
      case QuizDifficulty.easy:
        return context.l10n.easy;
      case QuizDifficulty.medium:
        return context.l10n.medium;
      case QuizDifficulty.hard:
        return context.l10n.hard;
    }
  }

  String getParam() {
    switch (this) {
      case QuizDifficulty.any:
        return 'Any';
      case QuizDifficulty.easy:
        return 'Easy';
      case QuizDifficulty.medium:
        return 'Medium';
      case QuizDifficulty.hard:
        return 'Hard';
    }
  }
}
