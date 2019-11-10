import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTittle = false, String titleText, removeBackButton = false}) {

  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(      
      isAppTittle ?  "FlutterShare" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTittle ? "Signatra" : "",
        fontSize: isAppTittle ? 50.0 : 22.0
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
