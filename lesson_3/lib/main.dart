import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:ui' as ui;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.deepOrange[500],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        centerTitle: true,
        title: const Text(
          "Weather Forecast",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: _buildBody(),
    ));
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _searchBar(),
        _location(),
        _temperature(),
        _forecasts(),
        _weekForecast(),
      ],
    ),
  );
}

Widget _searchBar() {
  return Container(
    margin: const EdgeInsets.all(30.0),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.search_outlined,
          color: Colors.white70,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text("Enter City Name",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            )),
      ],
    ),
  );
}

Widget _location() {
  var currentDate = _currentDateTime();
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Almaty, KZ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          currentDate,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white70,
          ),
        )
      ],
    ),
  );
}

String _currentDateTime() {
  var now = DateTime.now();
  return DateFormat.yMMMMd('en_US').format(now);
}

Widget _temperature() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wb_sunny_rounded,
          size: 70,
          color: Colors.white,
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          children: [
            Text(
              "14 °F",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 60,
                color: Colors.white70,
              ),
            ),
            Text(
              "LIGHT SNOW",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _forecasts() {
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.ac_unit,
              size: 40,
              color: Colors.white,
            ),
            Text(
              "5",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            Text(
              "km/hr",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
              ),
            )
          ],
        ),
        SizedBox(
          width: 50.0,
        ),
        Column(
          children: [
            Icon(
              Icons.ac_unit,
              size: 40,
              color: Colors.white,
            ),
            Text(
              "3",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            Text(
              "km/hr",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
              ),
            )
          ],
        ),
        SizedBox(
          width: 50.0,
        ),
        Column(
          children: [
            Icon(
              Icons.ac_unit,
              size: 40,
              color: Colors.white,
            ),
            Text(
              "20",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            Text(
              "km/hr",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white70,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _weekForecast() {
  var weekdays = _days();
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "7-DAY WEATHER FORECAST",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          height: 80.0,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(7, (index) => _boxes(weekdays[index]))),
        ),
      ],
    ),
  );
}

Widget _boxes(Weekday day) {
  return Container(
    width: 100,
    height: 80,
    color: Colors.white54.withOpacity(0.3),
    margin: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day.day,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${day.grade} °F ",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white70,
              ),
            ),
            const Icon(
              Icons.wb_sunny_rounded,
              color: Colors.white,
              size: 30,
            )
          ],
        )
      ],
    ),
  );
}

class Weekday {
  const Weekday(this.day, this.grade);

  final String day;
  final String grade;
}

List<Weekday> _days() {
  List<Weekday> days = [
    const Weekday("Friday", "6"),
    const Weekday("Saturday", "5"),
    const Weekday("Sunday", "10"),
    const Weekday("Monday", "14"),
    const Weekday("Tuesday", "9"),
    const Weekday("Wednesday", "21"),
    const Weekday("Thursday", "22")
  ];
  return days;
}
