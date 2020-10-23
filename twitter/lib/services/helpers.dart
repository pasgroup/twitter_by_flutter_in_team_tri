import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart';

class Helpers {
  dynamic getJson(String body) {
    JsonCodec codec = JsonCodec();
    try {
      return codec.decode(body);
    } catch (e) {
      return [];
    }
  }

  String firstError(Response response) {
    var _body = getJson(response.body); //dynamic type
    Map _errors = _body['errors'];
    var _list = _errors.values.toList();
    Map _messages = _list[0];
    return _messages.values.toList()[0].toString();
  }

  Future<void> dialog({BuildContext context, String title, String description}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> assetDialog({BuildContext context, String title, String message, Function onOkPressed, Image image}) {
    return showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
              image: image,
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              entryAnimation: EntryAnimation.BOTTOM,
              description: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onOkButtonPressed: onOkPressed,
              onlyOkButton: true,
            ));
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.search,
            color: kWhiteColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.shopping_cart,
            color: kWhiteColor,
          ),
          onPressed: () {},
        )
      ],
      title: Text("Flutter "),
    );
  }

//  RaisedButton button({String text,Function onPress}){
//    return RaisedButton(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//      padding: EdgeInsets.all(10),
//      onPressed: onPress,
//      child: Text(
//        text,
//        style: kButtonPrimary,
//      ),
//    ),
//  }
}
