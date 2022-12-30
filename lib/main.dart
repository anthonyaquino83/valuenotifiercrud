import 'package:crudvaluenotifier/car_controller.dart';
import 'package:crudvaluenotifier/car_repository.dart';
import 'package:flutter/material.dart';

import 'car_list_view_page.dart';

void main() {
  final repository = CarRepository();
  final controller = CarController(repository);
  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.controller});
  final CarController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarListViewPage(
        title: 'ValueNotifier CRUD',
        controller: controller,
      ),
    );
  }
}
