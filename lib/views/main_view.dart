import 'package:flutter/material.dart';
import 'package:nss_tracker/model/user_model.dart';
import 'package:nss_tracker/views/home_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  // final List<Widget> views = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              snap: true,
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
                  IconButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => UserView()));
                    },
                    icon: Icon(Icons.account_circle_outlined),
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ];
        },
        body: HomeView(userModel: Provider.of<UserModel>(context)),
      ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.circular(20.0),
      //   child: BottomNavigationBar(

      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     elevation: 20.0,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: "Placeholder"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: "Placeholder"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: "Placeholder"),
      //       // BottomNavigationBarItem(
      //       // icon: Icon(Icons.settings), label: "Placeholder"),
      // ],
      // ),
      // ),
    );
  }
}
