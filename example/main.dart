import 'package:flutter/material.dart';
import 'package:simple_x/simple_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              const Text("SimpleX",
                      style: TextStyle(color: Colors.white, fontSize: 37))
                  .showIf(true)
                  .onPressed(() {
                "onPressed Called".showWhiteToast();
              }).centered(),
              
            ],
          )),
    );
  }
}
