import 'package:flutter/cupertino.dart';

class ListTileModel {

  String label, hint;
  VoidCallback callback;

  ListTileModel(this.label, this.callback, {this.hint});

}