import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  String _text = "Genap";
  bool _visible = false;

  void _incrementCounter() {
    setState(() {
      _counter++;

      if(_counter%2==0){
        _text = "Genap";
        _fontColor = Colors.red;
      }
      else{
        _text = "Ganjil";
        _fontColor = Colors.blue;
      }
      _visible = true;
    });
  }

  void _decrementCounter() {
    if(_counter>=1){
      setState(() {
        _counter--;
        
        if(_counter==0){
          _visible=false;
        }

        if(_counter%2==0){
          _text = "Genap";
          _fontColor = Colors.red;
        }
        else{
          _text = "Ganjil";
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_text',
              style: TextStyle(
                color: _fontColor,
              )
            ),
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
                )
              ),
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
      )
    )
    ;
  }
}
