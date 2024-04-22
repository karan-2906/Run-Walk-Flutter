import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        color: Color(0xfff8f8f8),
        child: IconTheme(
          data: IconThemeData(color: Color(0xffabadb4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.add_chart),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/map');
                  },
                  child: Icon(Icons.map)),
              Transform.translate(
                offset: Offset(0, -20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              // end: Alignment.bottomRight,
                              colors: [
                                Color(0xff92e2ff),
                                Color(0xff1ebdf8),
                              ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      )),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/calendar');
                  },
                  child: Icon(Icons.date_range)),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/details');
                  },
                  child: Icon(Icons.settings)),
              
            ],
          ),
        ));
  }
}
