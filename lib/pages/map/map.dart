import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:runwalktrackermine/pages/map/widgets/mapview.dart';
import 'package:runwalktrackermine/widgets/bottom_navigation.dart';

class Mappage extends StatelessWidget {
  const Mappage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Column(children: [
          Expanded(child: Mapview(),),
          BottomNavigation(),
        ]));
  }
}
