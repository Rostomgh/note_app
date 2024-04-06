import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Pr%C3%A9sentation/Home/HomeP.dart';
import 'package:note_app/Pr%C3%A9sentation/Routes/Ongenerate.dart';
import 'package:note_app/Pr%C3%A9sentation/auth/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBAM4Q18JVTq6hujk5qNUEWOQITKbTtTHE',
              appId: '1:1019634610835:android:b0cb9344d395ac4f985366',
              messagingSenderId: '1019634610835',
              projectId: 'note-app-66144'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int dataLength = 0;
  @override
  void setState(VoidCallback fn) {
    
    super.setState(fn);
  }







  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('================================User is currently signed out!');
      } else {
        print('================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginPage()
          : HomePage(),
      initialRoute: '/Login',
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
    );
  }
}
