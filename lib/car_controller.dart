import 'package:crudvaluenotifier/car_repository.dart';
import 'package:crudvaluenotifier/car_state.dart';
import 'package:flutter/cupertino.dart';

import 'car_model.dart';

class CarController extends ValueNotifier<CarState> {
  CarController(this.repository) : super(CarState.initial());
  final CarRepository repository;

  Future<void> loadCars() async {
    value = CarState.loading();
    try {
      value = CarState.success(await repository.fetchCars());
    } catch (e) {
      value = CarState.error();
    }
  }

  Future<void> addCar(String name) async {
    value = CarState.loading();
    await Future.delayed(const Duration(seconds: 1));
    await repository.addCar(name);
    List<Car> cars = await repository.fetchCars();
    value = CarState.success(cars);
  }

  Future<void> updateCar(int index, String name) async {
    value = CarState.loading();
    await Future.delayed(const Duration(seconds: 1));
    await repository.updateCar(index, name);
    List<Car> cars = await repository.fetchCars();
    value = CarState.success(cars);
  }

  Future<void> removeCar(Car car) async {
    value = CarState.loading();
    await Future.delayed(const Duration(seconds: 1));
    await repository.removeCar(car);
    List<Car> cars = await repository.fetchCars();
    value = CarState.success(cars);
  }
}
