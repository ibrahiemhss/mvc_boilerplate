// @dart=2.9
import 'package:mvc_boilerplate/src/constants/assets.dart';
import 'package:flutter/material.dart';

class StatisticsCarouselLoaderWidget extends StatelessWidget {
  const StatisticsCarouselLoaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        color: Theme.of(context).primaryColor,
//        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            double _marginLeft = 0;
            (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
            return Container(
              margin: EdgeInsetsDirectional.only(
                  start: _marginLeft, end: 20, top: 25, bottom: 25),
//              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              width: 110,
              height: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Image.asset(Assets.loadingState2,
                  fit: BoxFit.contain),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
