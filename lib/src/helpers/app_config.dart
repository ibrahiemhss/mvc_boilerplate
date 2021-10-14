// @dart=2.9
import 'package:mvc_boilerplate/src/constants/colors.dart';
import 'package:mvc_boilerplate/src/constants/general_constants.dart';
import 'package:mvc_boilerplate/src/data/repository/settings_repository.dart';
import 'package:flutter/material.dart';


class App {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
//    int.parse(settingRepo.setting.mainColor.replaceAll("#", "0xFF"));
    return _widthPadding * v;
  }
}

class Colors {
  Color mainColor(double opacity) {
    return AppColors.mainColor.withOpacity(opacity);
    /* try {
      return Color(
          int.parse(
              setting.value.mainColor.replaceAll("#", "0xFF"))
      )
          .withOpacity(opacity);
    } catch (e) {
      return Color(0xFFCCCCCC).withOpacity(opacity);
    }*/
  }

  Color titleTextColor(double opacity) {
    return AppColors.titleTextColor.withOpacity(opacity);
  }
  Color subtitleTextColor(double opacity) {
    return AppColors.subtitleTextColor.withOpacity(opacity);
  }
  Color headlineTextColor(double opacity) {
    return AppColors.headlineTextColor.withOpacity(opacity);
  }
  Color accentColor(double opacity) {
    return AppColors.accentColor.withOpacity(opacity);
  }

  Color mainDarkColor(double opacity) {
    return AppColors.mainDarkColor.withOpacity(opacity);

  }

  Color titleTextDarkColor(double opacity) {
    return AppColors.titleTextDarkColor.withOpacity(opacity);
  }
  Color subtitleTextDarkColor(double opacity) {
    return AppColors.subtitleTextDarkColor.withOpacity(opacity);
  }
  Color headlineTextDarkColor(double opacity) {
    return AppColors.headlineTextDarkColor.withOpacity(opacity);
  }

  Color accentDarkColor(double opacity) {
    return AppColors.accentDarkColor.withOpacity(opacity);

  }

  Color scaffoldColor(double opacity) {
    return AppColors.scaffoldColor.withOpacity(opacity);
  }
}
