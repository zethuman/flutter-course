import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Counter",
          ),
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
        ),
        backgroundColor: Colors.indigoAccent[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tap \" - \" to decrease",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _CounterWidget(),
              const Text(
                "Tap \" + \" to increase",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<_CounterWidget> {
  int _value = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white60,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 110.0, vertical: 10.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  _value = _value - 1;
                });
              },
              child: const Icon(
                Icons.remove,
                size: 20,
                color: Colors.black,
              )),
          Text(
            "$_value",
            style: const TextStyle(fontSize: 25),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _value = _value + 1;
                });
              },
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
