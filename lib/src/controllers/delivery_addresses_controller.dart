// @dart=2.9
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/address.dart' as model;
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

class DeliveryAddressesController extends ControllerMVC {
  List<model.Address> addresses = <model.Address>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  UserRepository userRepo = getIt<UserRepository>();

  DeliveryAddressesController(BuildContext context) {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForAddresses( context);
  }

  void listenForAddresses(BuildContext context,{String message}) async {
    final Stream<model.Address> stream = await userRepo.getAddresses();
    stream.listen((model.Address _address) {
      setState(() {
        addresses.add(_address);
      });
    }, onError: (a) {
      print(a);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  Future<void> refreshAddresses(BuildContext context) async {
    addresses.clear();
    listenForAddresses(context,message: S.of(context).addresses_refreshed_successfuly);
  }

  void addAddress(BuildContext context,model.Address address) {
    userRepo.addAddress(address).then((value) {
      setState(() {
        this.addresses.add(value);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).new_address_added_successfully),
      ));
    });
  }

  void updateAddress(BuildContext context,model.Address address) {
//    if (address.isDefault) {
//      this.addresses.map((model.Address _address) {
//        setState(() {
//          _address.isDefault = false;
//        });
//      });
//    }
    userRepo.updateAddress(address).then((value) {
      //setState(() {});
//      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//        content: Text(S.of(context).the_address_updated_successfully),
//      ));
      setState(() {});
      addresses.clear();
      listenForAddresses(context,message: S.of(context).the_address_updated_successfully);
    });
  }

  void removeDeliveryAddress(model.Address address,BuildContext context) async {
    userRepo.removeDeliveryAddress(address).then((value) {
      setState(() {
        this.addresses.remove(address);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Delivery Address removed successfully"),
      ));
    });
  }
}
