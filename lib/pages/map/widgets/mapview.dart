import 'package:flutter/material.dart';


class Mapview extends StatelessWidget {
  const Mapview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text('Map View'),
            ),
          ),
        ),
      ]),
    );
  }
}