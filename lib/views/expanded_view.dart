import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nss_tracker/model/event_model.dart';

class ExpandedView extends StatelessWidget {
  ExpandedView(
      {Key? key,
      required this.event,
      required this.isOngoing,
      required this.isOnline})
      : super(key: key);
  final bool isOngoing;
  final Event event;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        // floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
            backgroundColor:
                isOngoing ? Colors.lightGreenAccent[700] : Colors.blue[400],
            title: innerBoxIsScrolled
                ? Text(
                    "UPCOMING EVENT",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.apply(color: Colors.white, fontSizeDelta: -5),
                  )
                : null,
            floating: true,
            // snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: event.id,
                child: Image.asset(
                  "assets/images/webinar.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline5?.apply(
                          fontFamily: "Feather",
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontSizeDelta: 3),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              DateFormat("d'th' MMM, y")
                                  .format(event.date)
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.apply(fontSizeDelta: -1)),
                          Text(DateFormat("h:mm").format(event.date).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.apply(fontSizeDelta: -1)),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(fontWeightDelta: 2),
                      ),
                      SizedBox(height: 10),
                      Text(event.description),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instruction",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(fontWeightDelta: 2),
                      ),
                      SizedBox(height: 10),
                      Text(event.description),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(5.0),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade50),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)))),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Add to Calender".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.lightGreenAccent[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                isOnline
                                    ? "Join".toUpperCase()
                                    : "Submit".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightGreenAccent.shade700),
                          elevation: MaterialStateProperty.all<double>(5.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
