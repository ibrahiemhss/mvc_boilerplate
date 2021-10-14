// @dart=2.9
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/statistic.dart';
import '../models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/dashboard_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';

class ProfileController extends ControllerMVC {
  User user = new User();
  GlobalKey<ScaffoldState> scaffoldKey;
  List<Statistic> statistics = <Statistic>[];
  UserRepository userRepo = getIt<UserRepository>();

  ProfileController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForUser();
  }

  void listenForUser() {
    userRepo.getCurrentUser().then((_user) {
      setState(() {
        user = _user;
      });
    });
  }

  void listenForStatistics(context,{String message}) async {
    final Stream<Statistic> stream = await getStatistics();
    stream.listen((Statistic _stat) {
      setState(() {
        statistics.add(_stat);
      });
    }, onError: (a) {
      print(a);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {});
  }

  Future<void> refreshProfile(context) async {
    statistics.clear();
    user = new User();
    listenForStatistics(context);
    listenForUser();
  }
}
