import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Events ===>",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(101, 188, 70, 1.0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 150,
                  child: ListView.builder(
                      itemCount: 6,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20.0),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Title",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  Icons.notifications_outlined))
                                        ],
                                      ),
                                      Text(
                                        "10th August 2021, 17:00",
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upcoming Events ===>",
                    style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Title",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                              Icons.notifications_outlined))
                                    ],
                                  ),
                                  Text(
                                    "10th August 2021, 17:00",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text("Date: 10/09/2001"),
                                  //       Text("Time: 17:00"),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
