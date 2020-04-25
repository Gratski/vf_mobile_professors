import 'package:flutter/material.dart';

class DividersBuilder {
  static Container dividerWithCenteredText(String text) {
    if( text == null ) {
      return _createDivider();
    }

    return Container(
      margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  static Container _createDivider() {
    return Container(
      margin: EdgeInsets.only( top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
