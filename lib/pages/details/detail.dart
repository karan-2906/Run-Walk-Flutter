import 'package:flutter/material.dart';
import 'package:runwalktrackermine/pages/details/widgets/Stats.dart';
import 'package:runwalktrackermine/pages/details/widgets/appbar.dart';
import 'package:runwalktrackermine/pages/details/widgets/dates.dart';
import 'package:runwalktrackermine/pages/details/widgets/graph.dart';
import 'package:runwalktrackermine/pages/details/widgets/info.dart';
import 'package:runwalktrackermine/pages/details/widgets/steps.dart';
import 'package:runwalktrackermine/widgets/bottom_navigation.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(appBar: AppBar(),),
      body: Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Stats(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
