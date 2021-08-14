import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nss_tracker/model/event_model.dart';

class ExpandedView extends StatelessWidget {
  ExpandedView({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        // floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: Colors.blue[400],
            title: Text(
              "UPCOMING EVENT",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.apply(color: Colors.white, fontSizeDelta: -5),
            ),
            floating: true,
            snap: true,
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
                      style: Theme.of(context).textTheme.headline5?.apply(
                          fontFamily: "Feather",
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontSizeDelta: 3),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
