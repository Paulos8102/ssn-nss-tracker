import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nss_tracker/model/event_model.dart';
import 'package:nss_tracker/services/Events/firestore_events.dart';
import 'package:nss_tracker/views/expanded_view.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentOngoingPageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
        initialPage: _currentOngoingPageIndex,
        keepPage: false,
        viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreEvents.getFirestoreEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Event> events = snapshot.data as List<Event>;
            return ChangeNotifierProvider(
                create: (context) => Events(events: events),
                builder: (context, _) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await Provider.of<Events>(context, listen: false)
                          .fetchEvents();
                    },
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ongoing Events",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.apply(
                                        color: Colors.lightGreenAccent[400],
                                        fontWeightDelta: 1),
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
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    height: 220,
                                    child: PageView.builder(
                                        controller: _controller,
                                        itemCount: 6,
                                        // onPageChanged: (index) {
                                        //   setState(
                                        //       () => _currentOngoingPageIndex = index);
                                        // },
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Transform.scale(
                                              // scale:
                                              //     position == _currentOngoingPageIndex
                                              //         ? 1
                                              //         : 0.95,
                                              scale: 1,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             ExpandedView()));
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0)),
                                                        child: Image.asset(
                                                          "assets/images/webinar.jpg",
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Title",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline6
                                                                  ?.apply(
                                                                      fontWeightDelta:
                                                                          1),
                                                            ),
                                                            Text(
                                                              "10th August 2021, 17:00",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption,
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
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Upcoming Events",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.apply(
                                        color: Colors.blue, fontWeightDelta: 1),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              Provider.of<Events>(context)
                                                  .events
                                                  .length,
                                          itemBuilder: (context, position) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  onTap: () {
                                                    Event event =
                                                        Provider.of<Events>(
                                                                context,
                                                                listen: false)
                                                            .events[position];
                                                    Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                ExpandedView(
                                                                    isOnline:
                                                                        false,
                                                                    isOngoing:
                                                                        false,
                                                                    event:
                                                                        event)));
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Hero(
                                                        tag: Provider.of<
                                                                    Events>(
                                                                context,
                                                                listen: false)
                                                            .events[position]
                                                            .id,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0)),
                                                          child: Image.asset(
                                                            "assets/images/webinar.jpg",
                                                            fit: BoxFit.fill,
                                                            // height: 200,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              Provider.of<Events>(
                                                                      context)
                                                                  .events[
                                                                      position]
                                                                  .name,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline6,
                                                            ),
                                                            Text(
                                                              DateFormat(
                                                                      "MMMM d'th' y, hh:mm")
                                                                  .format(Provider.of<
                                                                              Events>(
                                                                          context)
                                                                      .events[
                                                                          position]
                                                                      .date),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .caption,
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
                          )),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
