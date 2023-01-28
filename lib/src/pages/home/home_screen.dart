import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_intro/user_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final nomeController = TextEditingController();
  final ageController = TextEditingController();
  

  TextStyle commonStyle() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get-x"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nomeController,
                        decoration: const InputDecoration(label: Text("Nome")),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          userController.setUserName(nomeController.text);
                        },
                        child: const Text("Salvar"))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(label: Text("Idade")),
                    )),
                    ElevatedButton(
                        onPressed: () {
                          userController
                              .setUserAge(int.parse(ageController.text));
                        },
                        child: const Text("Salvar"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DataScree();
                      }));
                    },
                    child: const Text("Tela de dados"))
              ]),
        ));
  }
}

class DataScree extends GetView<UserController> {
   const DataScree({
    
    Key? key,
  }) : super(key: key);
  //final controller = Get.find<UserController>();

  TextStyle commonStyle() =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Dados"),
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Nome: ${controller.user.value.name} ", style: commonStyle())),
            Obx(() => Text("Idade ${controller.user.value.age} ",
                style: commonStyle())),
      
          ],
        ),
      ),
    ),
    );
  }
}
