import 'package:crudvaluenotifier/car_controller.dart';
import 'package:flutter/material.dart';

import 'car_model.dart';

class CarDetailsViewPage extends StatefulWidget {
  const CarDetailsViewPage(
      {super.key, required this.car, required this.controller});
  final Car? car;
  final CarController controller;

  @override
  State<CarDetailsViewPage> createState() => _CarDetailsViewPageState();
}

class _CarDetailsViewPageState extends State<CarDetailsViewPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController carFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    carFieldController.text = widget.car?.name ?? '';
    return Scaffold(
      appBar: AppBar(
        title: widget.car == null
            ? const Text('Insert Car')
            : const Text('Edit Car'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: carFieldController,
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Required Field' : null,
                onFieldSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    widget.car == null
                        ? widget.controller.addCar(carFieldController.text)
                        : widget.controller
                            .updateCar(widget.car!.id, carFieldController.text);
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.car == null
                          ? widget.controller.addCar(carFieldController.text)
                          : widget.controller.updateCar(
                              widget.car!.id, carFieldController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
