import 'package:flutter/material.dart';
import 'package:nss_tracker/views/expanded_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ongoing Events",
                style: Theme.of(context).textTheme.headline5?.apply(
                    color: Colors.lightGreenAccent[400], fontWeightDelta: 1),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(101, 188, 70, 1.0),
                  color: Colors.lightGreenAccent[400],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        height: 230,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 230,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20.0),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExpandedView()));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight:
                                                    Radius.circular(20.0)),
                                            child: Image.asset(
                                              "assets/images/webinar.jpg",
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Title",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      ?.apply(
                                                          fontWeightDelta: 1),
                                                ),
                                                Text(
                                                  "10th August 2021, 17:00",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.apply(
                                                          color:
                                                              Colors.grey[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Upcoming Events",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.apply(color: Colors.blue, fontWeightDelta: 1),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      ListView.builder(
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0)),
                                        child: Image.asset(
                                          "assets/images/webinar.jpg",
                                          fit: BoxFit.fill,
                                          // height: 200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Title",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                            Text(
                                              "10th August 2021, 17:00",
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
