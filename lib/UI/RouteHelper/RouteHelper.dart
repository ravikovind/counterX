import 'package:counter/UI/Pages/MyHomePage.dart';
import 'package:counter/UI/Pages/OtherScreen.dart';
import 'package:counter/UI/Pages/otherX.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
      case '/Other':
        return MaterialPageRoute(
          builder: (_) => OtherScreen(),
        );
      case '/OtherX':
        return MaterialPageRoute(builder: (_) => OtherX());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("Error"),
                  ),
                ));
    }
  }
}
