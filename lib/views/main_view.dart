import 'package:flutter/material.dart';
import 'package:nss_tracker/views/home_view.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  final List<Widget> views = <Widget>[HomeView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              forceElevated: innerBoxIsScrolled,
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.blue,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.whatshot,
                        color: Colors.red,
                      ),
                      Text(
                        "12",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  Icon(
                    Icons.repeat,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ];
        },
        body: views[0],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   elevation: 20.0,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: "Placeholder"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: "Placeholder"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: "Placeholder"),
      //     // BottomNavigationBarItem(
      //     // icon: Icon(Icons.settings), label: "Placeholder"),
      //   ],
      // ),
    );
  }
}
