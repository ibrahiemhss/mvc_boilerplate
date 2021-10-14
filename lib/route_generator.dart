// @dart=2.9
import 'package:flutter/material.dart';

import 'src/models/route_argument.dart';
import 'src/pages/chat.dart';
import 'src/pages/details.dart';
import 'src/pages/forget_password.dart';
import 'src/pages/help.dart';
import 'src/pages/languages.dart';
import 'src/pages/login.dart';
import 'src/pages/notifications.dart';
import 'src/pages/pages.dart';
import 'src/pages/settings.dart';
import 'src/pages/signup.dart';
import 'src/pages/splash_screen.dart';

class RouteGenerator {
  final BuildContext context;
  static const String splash = '/Splash';
  static const String signUp = '/SignUp';
  static const String mobileVerification = '/MobileVerification';
  static const String mobileVerification2 = '/MobileVerification2';
  static const String login = '/Login';
  static const String forgetPassword = '/ForgetPassword';
  static const String pages = '/Pages';
  static const String chat = '/Chat';
  static const String details = '/Details';
  static const String notifications = '/Notifications';
  static const String languages = '/Languages';
  static const String help = '/Help';
  static const String setting = '/Setting';

  RouteGenerator(this.context);

  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpWidget(context));
      case mobileVerification:
        return MaterialPageRoute(builder: (_) => SignUpWidget(context));
      case mobileVerification2:
        return MaterialPageRoute(builder: (_) => SignUpWidget(context));
      case login:
        return MaterialPageRoute(builder: (_) => LoginWidget(context));
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordWidget(context));
      case pages:
        return MaterialPageRoute(
            builder: (_) => PagesTestWidget(currentTab: args));
      case chat:
        return MaterialPageRoute(
            builder: (_) => ChatWidget(routeArgument: args as RouteArgument));
      case details:
        return MaterialPageRoute(
            builder: (_) => DetailsWidget(routeArgument: args));
      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationsWidget(context));
      case languages:
        return MaterialPageRoute(builder: (_) => LanguagesWidget());
      case help:
        return MaterialPageRoute(builder: (_) => HelpWidget(context));
      case setting:
        return MaterialPageRoute(builder: (_) => SettingsWidget());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}
