import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runwalktrackermine/pages/Calendar/calendar.dart';
import 'package:runwalktrackermine/pages/details/detail.dart';
import 'package:runwalktrackermine/pages/home/home.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rum Walk Tracker',
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          )),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/calendar': (context) => CalendarPage()
      },
      initialRoute: '/',
    );
  }
}
