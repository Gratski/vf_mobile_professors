import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticatedStatefulScreen extends StatefulWidget {

  authenticate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString("authToken");
    if ( authToken == null || authToken.isEmpty ) {
      unauthorizedCallback(context);
    }
  }

  unauthorizedCallback(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
  }

}