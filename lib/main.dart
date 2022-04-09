import 'package:flutter/material.dart';
import 'package:project_cars_eekkawit620710380/pages/car/car_list_page.dart';
import 'package:project_cars_eekkawit620710380/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cars',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Car(),
    );
  }
}
