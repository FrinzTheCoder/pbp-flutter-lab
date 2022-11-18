import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 7 PBP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _fontColor = Colors.red;
  String _text = "GENAP";
  bool _visible = false;

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        _text = "GENAP";
        _fontColor = Colors.red;
      } else {
        _text = "GANJIL";
        _fontColor = Colors.blue;
      }
      _visible = true;
    });
  }

  void _decrementCounter() {
    if (_counter >= 1) {
      setState(() {
        _counter--;

        if (_counter == 0) {
          _visible = false;
        }

        if (_counter % 2 == 0) {
          _text = "GENAP";
          _fontColor = Colors.red;
        } else {
          _text = "GANJIL";
          _fontColor = Colors.blue;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$_text',
                  style: TextStyle(
                    color: _fontColor,
                  )),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                    visible: _visible,
                    child: FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ));
  }
}
