import 'package:flutter/cupertino.dart';

class Dimens {
  Dimens._();

  //for all screens
  static const double horizontal_padding = 12.0;
  static const double vertical_padding = 12.0;
  static const double topMargin100PX = 100.0;
  static const double logoSize = 124;
  static const double menuIconSize = 24;
  static const double headersTextSize = 18;
  static const double menuRowSpaceDivider = 8;

  static double screenWidth(context) =>
      MediaQuery
          .of(context)
          .size
          .width;

  static double screenHeight(context) =>
      MediaQuery
          .of(context)
          .size
          .height;
}
