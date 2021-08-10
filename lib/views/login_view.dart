import 'package:flutter/material.dart';
import 'package:nss_tracker/views/main_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "NSS Tracker",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.apply(fontWeightDelta: 1, color: Colors.black),
              ),
              Text(
                "Get Started and track your Progress",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.apply(fontWeightDelta: 1),
              ),
              MaterialButton(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Color.fromRGBO(101, 188, 70, 1.0),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainView()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
