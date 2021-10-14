// @dart=2.9
import 'dart:async';
import 'dart:io';
import 'package:mvc_boilerplate/src/constants/general_constants.dart';
import 'package:mvc_boilerplate/src/data/repository/settings_repository.dart';
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../../route_generator.dart';
import '../helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

class SplashScreenController extends ControllerMVC with ChangeNotifier {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;
  SettingsRepository settingRepo = getIt<SettingsRepository>();

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    // Should define these variables before the app loaded
    progress.value = {GeneralConstants.setting: 0, GeneralConstants.user: 0};
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    FirebaseMessaging.instance.requestPermission(
        sound: true, badge: true, alert: true);
    configureFirebase();
    setting.addListener(() {
      if (setting.value.appName != null &&
          setting.value.appName != '' &&
          setting.value.mainColor != null) {
        progress.value[GeneralConstants.setting] = 100;
        progress?.notifyListeners();
      }
    });
    userRepo.currentUser.addListener(() {
      if (userRepo.currentUser.value.auth != null) {
        progress.value[GeneralConstants.user] = 100;
        progress?.notifyListeners();
      }
    });
    Timer(Duration(seconds: 20), () {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("S.of(context).verify_your_internet_connection"),
      ));
    });
  }

  void configureFirebase() {
    try {

      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage message) {
        if (message != null) {
          RemoteNotification notification = message.notification;
          String title = notification.title;
          String body = notification.body;
          notificationOnResume(message.data);
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;

        if (notification != null && android != null) {
          String title = notification.title;
          String body = notification.body;
          notificationOnMessage(message.data);
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (message != null) {
          RemoteNotification notification = message.notification;
          String title = notification.title;
          String body = notification.body;
          notificationOnLaunch(message.data);
        }
      });
/*
    _firebaseMessaging.configure(
        onMessage: notificationOnMessage,
        onLaunch: notificationOnLaunch,
        onResume: notificationOnResume,
      );*/
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
      print(CustomTrace(StackTrace.current, message: 'Error Config Firebase'));
    }
  }

  Future notificationOnResume(Map<String, dynamic> message) async {
    print(CustomTrace(StackTrace.current, message: message['data']['id']));
    try {
      if (message['data']['id'] == "orders") {
        settingRepo.navigatorKey.currentState
            .pushReplacementNamed(RouteGenerator.pages, arguments: 2);
      } else if (message['data']['id'] == "messages") {
        settingRepo.navigatorKey.currentState
            .pushReplacementNamed(RouteGenerator.pages, arguments: 3);
      }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Future notificationOnLaunch(Map<String, dynamic> message) async {
    String messageId = await settingRepo.getMessageId();
    try {
      if (messageId != message[GeneralConstants.googleMessageId]) {
        await settingRepo.saveMessageId(message[GeneralConstants.googleMessageId]);
        if (message['data']['id'] == "orders") {
          settingRepo.navigatorKey.currentState
              .pushReplacementNamed(RouteGenerator.pages, arguments: 2);
        } else if (message['data']['id'] == "messages") {
          settingRepo.navigatorKey.currentState
              .pushReplacementNamed(RouteGenerator.pages, arguments: 3);
        }
      }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Future notificationOnMessage(Map<String, dynamic> message) async {
    Fluttertoast.showToast(
      msg: message[GeneralConstants.notification][GeneralConstants.title],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 6,
    );
  }
}
