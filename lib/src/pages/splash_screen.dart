// @dart=2.9
import 'package:mvc_boilerplate/src/constants/assets.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../route_generator.dart';
import '../controllers/splash_screen_controller.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends StateMVC<SplashScreen> {
  SplashScreenController _con;

  SplashScreenState() : super(SplashScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    _con.progress.addListener(() {
      double progress = 0;
      _con.progress.value.values.forEach((_progress) {
        progress += _progress;
        print(CustomTrace(StackTrace.current,
            message: "progress: ${progress.toString()}"));
      });
      if (progress == 100) {
        try {
          if (currentUser.value.apiToken == null) {
            Navigator.of(context).pushReplacementNamed(RouteGenerator.login);
          } else {
            Navigator.of(context).pushReplacementNamed(RouteGenerator.pages, arguments: 2);
          }
        } catch (e) {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _con.scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Assets.logo,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
