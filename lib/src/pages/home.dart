// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../../route_generator.dart';
import '../controllers/home_controller.dart';
import '../elements/CardWidget.dart';
import '../elements/EmptyDataWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';
import '../models/route_argument.dart';

class HomeWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomeWidget({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomeWidgetWidgeState createState() => _HomeWidgetWidgeState();
}

class _HomeWidgetWidgeState extends StateMVC<HomeWidget> {
  HomeController _con;

  _HomeWidgetWidgeState() : super(HomeController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForMainData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).all_data,
          style: Theme.of(context)
              .textTheme
              .headline6
              .merge(TextStyle(letterSpacing: 1.3)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          _con.refreshMainData(context);
        },
        child: _con.mainDataList.isEmpty
            ? EmptyDataWidget()
            : ListView.builder(
                shrinkWrap: true,
                primary: true,
                itemCount: _con.mainDataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteGenerator.details,
                          arguments: RouteArgument(
                            id: _con.mainDataList.elementAt(index).id,
                            heroTag: 'home',
                          ));
                    },
                    child: CardWidget(
                        mainData: _con.mainDataList.elementAt(index),
                        heroTag: 'home'),
                  );
                },
              ),
      ),
    );
  }
}
