import 'car_model.dart';

class CarState {
  final List<Car> cars;
  final bool loading;
  final bool error;

  CarState.initial()
      : cars = [],
        error = false,
        loading = false;

  CarState.loading()
      : cars = [],
        error = false,
        loading = true;

  CarState.success(this.cars)
      : error = false,
        loading = false;

  CarState.error()
      : cars = [],
        error = true,
        loading = false;
}
