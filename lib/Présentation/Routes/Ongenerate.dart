import 'package:flutter/material.dart';
import 'package:note_app/Pr%C3%A9sentation/Home/HomeP.dart';
import 'package:note_app/Pr%C3%A9sentation/Home/NewFolde.dart';
import 'package:note_app/Pr%C3%A9sentation/Home/SearchP.dart';
import 'package:note_app/Pr%C3%A9sentation/Routes/Error_Route.dart';
import 'package:note_app/Pr%C3%A9sentation/auth/Login.dart';
import 'package:note_app/Pr%C3%A9sentation/auth/Signup.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/Sign_up':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case 'Home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'new':
        return MaterialPageRoute(builder: (_) => NewFolder());
      case 'search':
        return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => ErrorRoute());
    }
  }
}
