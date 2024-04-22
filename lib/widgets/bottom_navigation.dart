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
              Column(
                children: [
                  Icon(Icons.add_chart),
                  Text('Stats', style: TextStyle(fontSize: 10)),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/map');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.map),
                      Text('Map', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  ),
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
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          // Text(
                          //   'Home',
                          //   style: TextStyle(color: Colors.white, fontSize:10 ),
                          // )
                        ],
                      )),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/calendar');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.date_range),
                      Text('Calendar', style: TextStyle(fontSize: 10)),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/details');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.settings),
                      Text('Settings', style: TextStyle(fontSize: 10)),
                    ],
                  )),
              
            ],
          ),
        ));
  }
}
