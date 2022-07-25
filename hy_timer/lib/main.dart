import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hy_timer/timer.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HYTimerPage(),
    );
  }
}
