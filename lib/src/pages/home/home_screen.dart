import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_x_intro/value_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get-x"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text("Valor definido: ${ctrl.definedValue}");
              },
            ),
            TextFormField(
              controller: textController,
            ),
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return ctrl.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          valueController.setValue(value);
                        },
                        child: const Text("Definir"));
              },
            )
          ]),
        ));
  }
}
