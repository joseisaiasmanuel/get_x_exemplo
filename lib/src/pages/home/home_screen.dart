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
          title: const Text("Navegação"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
            const Expanded(
                child: Center(
                    child: Text(
              "Valor:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))),
            ElevatedButton(
                onPressed: () async {
                  /* final result= await  Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return  DataScree();
                      }));*/
                  final result = Get.to(() => DataScree());
                  print(result);
                
                    },
                child: const Text("Segunda Tela"))
              ]),
        ));
  }
}

class DataScree extends GetView<UserController> {
  DataScree({
    
    Key? key,
  }) : super(key: key);
  //final controller = Get.find<UserController>();

  TextStyle commonStyle() =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Definição de dado"),
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextFormField(
                controller: textController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    final value = textController.text;
                    // Navigator.of(context).pop(result);
                    Get.back(result: value);
                  },
                  child: const Text("Retonar"))
      
          ],
        ),
      ),
    ),
    );
  }
}
