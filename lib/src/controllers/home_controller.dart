// @dart=2.9
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/gallery.dart';
import '../models/main_data.dart';
import '../models/review.dart';
import 'package:mvc_boilerplate/src/data/repository/gallery_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/main_repository.dart';

class HomeController extends ControllerMVC {
  MainData mainData;
  List<Gallery> galleries = <Gallery>[];
  List<MainData> mainDataList = <MainData>[];
  List<Review> reviews = <Review>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  MainDataRepository mainDataRepo = getIt<MainDataRepository>();

  HomeController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenFormainDatas(context,{String message}) async {
    final Stream<MainData> streamList = await mainDataRepo.getListMainData();
    streamList.listen((MainData _mainData) {
      setState(() => mainDataList.add(_mainData));
    }, onError: (a) {
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

  void listenForMainData(context,{String id, String message}) async {
    final Stream<MainData> stream = await mainDataRepo.getMainData(id);
    stream.listen((MainData _mainData) {
      setState(() => mainData = _mainData);
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

  void listenForGalleries(String idMainData) async {
    final Stream<Gallery> stream = await getGalleries(idMainData);
    stream.listen((Gallery _gallery) {
      setState(() => galleries.add(_gallery));
    }, onError: (a) {}, onDone: () {});
  }

  void listenForMainDataReviews({String id, String message}) async {
    final Stream<Review> stream = await mainDataRepo.getMainDataReviews(id);
    stream.listen((Review _review) {
      setState(() => reviews.add(_review));
    }, onError: (a) {}, onDone: () {});
  }



  Future<void> refreshMainData(context) async {
    var _id = mainData.id;
    mainData = new MainData();
    galleries.clear();
    reviews.clear();
    listenForMainData(context,id: _id, message: S.of(context).mainData_refreshed_successfuly);
    listenForMainDataReviews(id: _id);
    listenForGalleries(_id);
  }

  Future<void> refreshMainDatas(context) async {
    mainDataList.clear();
    listenForMainData(context,message: S.of(context).mainData_refreshed_successfuly);
  }
}
