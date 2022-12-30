import 'package:crudvaluenotifier/car_controller.dart';
import 'package:crudvaluenotifier/car_details_view_page.dart';
import 'package:crudvaluenotifier/car_state.dart';
import 'package:flutter/material.dart';

class CarListViewPage extends StatefulWidget {
  final CarController controller;
  const CarListViewPage(
      {super.key, required this.title, required this.controller});

  final String title;

  @override
  State<CarListViewPage> createState() => _CarListViewPageState();
}

class _CarListViewPageState extends State<CarListViewPage> {
  @override
  void initState() {
    widget.controller.loadCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<CarState>(
        valueListenable: widget.controller,
        builder: (context, state, _) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error) {
            return const Center(
              child: Text('Erro ao buscar lista de carros'),
            );
          }
          return ListView.builder(
            itemCount: state.cars.length,
            itemBuilder: ((context, index) {
              var car = state.cars[index];
              return Dismissible(
                key: ObjectKey(car),
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text('${car.id} - ${car.name}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CarDetailsViewPage(
                              car: car,
                              controller: widget.controller,
                            )),
                      ),
                    );
                  },
                ),
                onDismissed: (direction) => widget.controller.removeCar(car),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => CarDetailsViewPage(
                    car: null,
                    controller: widget.controller,
                  )),
            ),
          );
        },
        tooltip: 'Incluir carro',
        child: const Icon(Icons.add),
      ),
    );
  }
}
