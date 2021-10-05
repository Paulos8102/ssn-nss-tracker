import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatefulWidget {
  final int currentIndex;
  final List<Icon> items;
  final Function(int value) onTap;

  FloatingNavigationBar(
      {Key? key,
      this.currentIndex = 0,
      required this.items,
      required this.onTap})
      : assert(items.length > 2),
        super(key: key);

  @override
  _FloatingNavigationBarState createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> {
  List<Widget> _generateItems(List<Icon> items) {
    List<Widget> tiles = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      tiles.add(GestureDetector(
        onTap: widget.onTap.call(i),
        child: items[i],
      ));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: _generateItems(widget.items),
      ),
    );
  }
}
