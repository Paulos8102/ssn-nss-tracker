import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_tracker/views/login_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NSS Tracker',
      theme: ThemeData(
        splashColor: Colors.green[50],
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        // fontFamily: "Feather",
        textTheme: TextTheme(
          headline6: Theme.of(context)
              .textTheme
              .headline6
              ?.apply(fontFamily: "Feather"),
          bodyText1: Theme.of(context)
              .textTheme
              .bodyText1
              ?.apply(color: Colors.grey[400]),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black),
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          bodyText1: TextTheme().bodyText1?.apply(color: Colors.grey[850]),
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.black),
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        // primaryTextTheme: TextTheme()
        // .apply(displayColor: Colors.white, bodyColor: Colors.white),
      ),
      themeMode: ThemeMode.light,
      // home: MainView(),
      home: LoginView(),
    );
  }
}
