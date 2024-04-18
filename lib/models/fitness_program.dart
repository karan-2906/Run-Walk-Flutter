import 'package:flutter/material.dart';

enum programType { running, yoga, cycling, weightlifting, swimming }

class FitnessProgram {
  final AssetImage image;
  final String name;
  final String cals;
  final String time;
  final programType type;

  FitnessProgram(
      {required this.image,
      required this.name,
      required this.cals,
      required this.time,
      required this.type});
}

final List<FitnessProgram> fitnessPrograms = [
  FitnessProgram(
    image: AssetImage("assets/gym running.jpg"),
    name: "Running",
    cals: "300kkal",
    time: "30 min",
    type: programType.running,
  ),
  FitnessProgram(
    image: AssetImage("assets/gym cycling.jpg"),
    name: "Cycling",
    cals: "400kkal",
    time: "40 min",
    type: programType.cycling,
  ),
  FitnessProgram(
    image: AssetImage("assets/gym yoga.jpg"),
    name: "Yoga",
    cals: "200kkal",
    time: "20 min",
    type: programType.yoga,
  ),
  // FitnessProgram(
  //   image: AssetImage("assets/gym weightlifting.jpg"),
  //   name: "Weightlifting",
  //   cals: "500kkal",
  //   time: "50 min",
  //   type: programType.weightlifting,
  // ),
  // FitnessProgram(
  //   image: AssetImage("assets/gym swimming.jpg"),
  //   name: "Swimming",
  //   cals: "350kkal",
  //   time: "35 min",
  //   type: programType.swimming,
  // ),
];
