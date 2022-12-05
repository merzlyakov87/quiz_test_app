import 'package:flutter/material.dart';
import 'package:quiz_test/l10n/l10n.dart';

enum QuizCategory {
  any,
  linux,
  bash,
  uncategorized,
  docker,
  sql,
  cms,
  code,
  devops
}

extension QuizCategoryExt on QuizCategory {
  String getName(BuildContext context) {
    switch (this) {
      case QuizCategory.any:
        return context.l10n.anyCategory;
      case QuizCategory.linux:
        return context.l10n.linux;
      case QuizCategory.bash:
        return context.l10n.bash;
      case QuizCategory.uncategorized:
        return context.l10n.uncatogorized;
      case QuizCategory.docker:
        return context.l10n.docker;
      case QuizCategory.sql:
        return context.l10n.sql;
      case QuizCategory.cms:
        return context.l10n.cms;
      case QuizCategory.code:
        return context.l10n.code;
      case QuizCategory.devops:
        return context.l10n.devops;
    }
  }
}
