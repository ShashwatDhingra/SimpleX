import 'package:flutter/material.dart';
import 'package:simple_x/extensions/simple_x_useful_ext.dart';
import 'package:simple_x/simple_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: SimpleXLoader.navigatorKey,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: const Text("SimpleX",
                  style: TextStyle(color: Colors.white, fontSize: 37))
              .showIf(true)
              .onPressed(() async {
            SimpleXLoader.show();
            SimpleXDevice.vibrate();
            await Future.delayed(1.seconds);
            "onPressed Called".showToast(
                backgroundColor: Colors.black, textColor: Colors.red);
            SimpleXLoader.hide();
          }).centered()),
    );
  }
}
