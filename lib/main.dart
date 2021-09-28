import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_tracker/model/user_model.dart' as userModel;
import 'package:nss_tracker/services/firebase/firebase.dart';
import 'package:nss_tracker/views/login_view.dart';
import 'package:nss_tracker/views/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.white,
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
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black),
          backgroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyText1: TextTheme().bodyText1?.apply(color: Colors.grey[850]),
          headline6: Theme.of(context)
              .textTheme
              .headline6
              ?.apply(fontFamily: "Feather", color: Colors.white),
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.black),
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        // primaryTextTheme: TextTheme()
        // .apply(displayColor: Colors.white, bodyColor: Colors.white),
      ),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return StreamBuilder(
                  stream: firebaseAuthServices.isSignedIn(),
                  builder: (context, snapshot) {
                    final User? user = snapshot.data as User?;
                    if (user == null) {
                      return LoginView();
                    } else {
                      return FutureBuilder(
                        future: firebaseAuthServices.getUserModel(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final user = snapshot.data as userModel.User;
                            return MainView(user: user);
                          } else {
                            return Scaffold(
                                body:
                                    Center(child: CircularProgressIndicator()));
                          }
                        },
                      );
                    }
                  });
            } else
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
          }),
    );
  }
}
