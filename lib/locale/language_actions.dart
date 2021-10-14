class LanguageActions {
  static LanguageActions instance = new LanguageActions.internal();

  LanguageActions.internal();

  factory LanguageActions() => instance;
  String changToCurrentLanguageNumber(String input, String locale) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    List nums = <String>[];

    switch (locale) {
      case "ar":
        {
          nums = [
            '\u06f0',
            '\u06f1',
            '\u06f2',
            '\u06f3',
            '\u06f4',
            '\u06f5',
            '\u06f6',
            '\u06f7',
            '\u06f8',
            '\u06f9'
          ];
        }
        break;

      case "en":
        {
          nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        }
        break;
      case "da":
        {
          nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        }
        break;
      case "es":
        {
          nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        }
        break;

      default:
        {
          nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
        }
        break;
    }

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], nums[i]);
    }

    return input;
  }
}
