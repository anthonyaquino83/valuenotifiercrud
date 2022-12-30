import 'dart:math';

import 'car_model.dart';

class CarRepository {
  List<Car> cars = [
    Car(id: 1, name: 'Celta'),
    Car(id: 2, name: 'Uno'),
    Car(id: 3, name: 'Sandero'),
  ];

  Future<List<Car>> fetchCars() async {
    List<Car> response =
        await Future.delayed(const Duration(seconds: 1), () => cars);
    cars.sort(((a, b) => a.id.compareTo(b.id)));
    return response;
  }

  Future<void> addCar(String name) async {
    int newId = Random().nextInt(100);
    cars.add(Car(id: newId, name: name));
  }

  Future<void> updateCar(int id, String name) async {
    final index = cars.indexWhere((car) => car.id == id);
    if (index >= 0) {
      cars[index] = Car(id: id, name: name);
    }
  }

  Future<void> removeCar(Car car) async {
    cars.remove(car);
  }
}
