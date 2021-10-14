// @dart=2.9
import 'package:mvc_boilerplate/src/data/repository/settings_repository.dart' as settingRepository;
import 'package:mvc_boilerplate/src/data/repository/settings_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class Controller extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  SettingsRepository settingRepo = getIt<SettingsRepository>();
  UserRepository userRepo = getIt<UserRepository>();

  Controller() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  void initState() {
    settingRepo.initSettings().then((setting) {
      setState(() {
        settingRepository.setting.value = setting;
      });
    });
    /*
    settingRepo.setCurrentLocation().then((locationData) {
      setState(() {
        settingRepo.locationData = locationData;
      });
    });
    */
    userRepo.getCurrentUser().then((user) {
      setState(() {
        currentUser.value = user;
      });
    });
  }
}
