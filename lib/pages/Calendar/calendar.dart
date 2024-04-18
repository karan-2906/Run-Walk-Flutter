import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:runwalktrackermine/widgets/bottom_navigation.dart';

void main() {
  runApp(MaterialApp(
    home: CalendarPage(),
  ));
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  double _previousValue = 0.0;
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      if ((_previousValue < 0 && event.y > 0) ||
          (_previousValue > 0 && event.y < 0)) {
        setState(() {
          _stepCount++;
        });
      }
      _previousValue = event.y;
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _showPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _showNextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  int _calculateTotalStepsForMonth() {
    int totalSteps = 0;
    DateTime currentDate = DateTime.now();

    // Include steps for current month's dates up to the current date
    final startOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    for (int i = 1; i <= currentDate.day; i++) {
      final random = Random(i);
      int steps =
          random.nextInt(3001) + 5000; // Random number between 5000 and 8000
      totalSteps += steps;
    }

    return totalSteps;
  }

  int _calculateTotalStepsForWeek() {
    int totalSteps = 0;
    DateTime currentDate = DateTime.now();

    // Get the start of the current week (Sunday)
    DateTime startOfWeek =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));

    // Iterate over the days of the current week till the current date
    for (int i = 0; i <= currentDate.weekday; i++) {
      final random = Random(startOfWeek.day + i);
      int steps =
          random.nextInt(3001) + 5000; // Random number between 5000 and 8000
      totalSteps += steps;
    }

    return totalSteps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _showPreviousMonth,
                child: Icon(Icons.arrow_back),
              ),
              SizedBox(width: 20),
              Text(
                DateFormat.yMMMM().format(_selectedDate),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _showNextMonth,
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDayNameCell('Sun'),
              _buildDayNameCell('Mon'),
              _buildDayNameCell('Tue'),
              _buildDayNameCell('Wed'),
              _buildDayNameCell('Thu'),
              _buildDayNameCell('Fri'),
              _buildDayNameCell('Sat'),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemBuilder: (context, index) {
                final startOfMonth =
                    DateTime(_selectedDate.year, _selectedDate.month, 1);
                final weekdayOfStart = startOfMonth.weekday;
                final daysInMonth =
                    DateTime(_selectedDate.year, _selectedDate.month + 1, 0)
                        .day;

                final dayNumber = index + 1 - weekdayOfStart;
                DateTime date;
                if (dayNumber <= 0 || dayNumber > daysInMonth) {
                  date = DateTime(0); // Placeholder for empty cells
                } else {
                  date = DateTime(
                      _selectedDate.year, _selectedDate.month, dayNumber);
                }

                // Check if the date is today
                final isToday = date.day == DateTime.now().day &&
                    date.month == DateTime.now().month;

                // Generate random steps for past dates
                int steps = 0;
                if (date.isBefore(DateTime.now()) && date != DateTime(0)) {
                  final random = Random(date.day);
                  steps = random.nextInt(3001) +
                      5000; // Random number between 5000 and 8000
                }

                return InkWell(
                  onTap: () {
                    if (date != DateTime(0)) {
                      _selectDate(date);
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.all(3), // Adjust padding for smaller size
                    margin: EdgeInsets.all(1), // Adjust margin for smaller size
                    decoration: BoxDecoration(
                      color: isToday ? Colors.blue : null,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (date !=
                            DateTime(0)) // Show date text only if it's valid
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              color: isToday ? Colors.white : null,
                              fontWeight: FontWeight.bold,
                              fontSize: isToday
                                  ? 14
                                  : 12, // Adjust font size for smaller size
                            ),
                          ),
                        if (date != DateTime(0) &&
                            date.isBefore(DateTime.now()) &&
                            steps !=
                                0) // Display steps only for past dates with valid date
                          SizedBox(height: 4),
                        if (date != DateTime(0) &&
                            date.isBefore(DateTime.now()) &&
                            steps !=
                                0) // Hide steps container if conditions are not met
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Steps:',
                                  style: TextStyle(
                                    color: isToday ? Colors.white : null,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        11, // Adjust font size for smaller size
                                  ),
                                ),
                                Text(
                                  '$steps',
                                  style: TextStyle(
                                    color: isToday ? Colors.white : null,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    // Adjust font size for smaller size
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 42, // 7 days * 6 rows
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text(
                  'Total Steps this Week:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_stepCount',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  'Total Steps this Month:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_stepCount',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          BottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildDayNameCell(String dayName) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        dayName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
