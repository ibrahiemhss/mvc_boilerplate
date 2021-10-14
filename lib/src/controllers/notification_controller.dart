// @dart=2.9
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/notification.dart' as model;
import 'package:mvc_boilerplate/src/data/repository/notification_repository.dart';

class NotificationController extends ControllerMVC {
  List<model.Notification> notifications = <model.Notification>[];
  int unReadNotificationsCount = 0;
  GlobalKey<ScaffoldState> scaffoldKey;
  NotificationRepository notificationRepo = getIt<NotificationRepository>();

  NotificationController(context) {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForNotifications(context);
  }

  void listenForNotifications(context,{String message}) async {
    final Stream<model.Notification> stream = await notificationRepo.getNotifications();
    stream.listen((model.Notification _notification) {
      setState(() {
        notifications.add(_notification);
      });
    }, onError: (a) {
      print(a);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {
      if (notifications.isNotEmpty) {
        unReadNotificationsCount = notifications.where((model.Notification _n) => !_n.read ?? false).toList().length;
      } else {
        unReadNotificationsCount = 0;
      }
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  Future<void> refreshNotifications(context) async {
    notifications.clear();
    listenForNotifications(context,message: S.of(context).notifications_refreshed_successfuly);
  }

  void doMarkAsReadNotifications(context,model.Notification _notification) async {
    notificationRepo.markAsReadNotifications(_notification).then((value) {
      setState(() {
        --unReadNotificationsCount;
        _notification.read = !_notification.read;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).thisNotificationHasMarkedAsRead),
      ));
    });
  }

  void doMarkAsUnReadNotifications(context,model.Notification _notification) {
    notificationRepo.markAsReadNotifications(_notification).then((value) {
      setState(() {
        ++unReadNotificationsCount;
        _notification.read = !_notification.read;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).thisNotificationHasMarkedAsUnRead),
      ));
    });
  }

  void doRemoveNotification(context,model.Notification _notification) async {
    notificationRepo.removeNotification(_notification).then((value) {
      setState(() {
        if (!_notification.read) {
          --unReadNotificationsCount;
        }
        this.notifications.remove(_notification);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).notificationWasRemoved),
      ));
    });
  }
}
