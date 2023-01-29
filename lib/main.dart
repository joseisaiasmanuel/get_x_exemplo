import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_intro/src/pages/home/home_screen.dart';
import 'package:get_x_intro/user_controller.dart';

void main (){
  Get.put<UserController>(UserController());
//  Get.lazyPut<UserController>(() => UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get-x',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
       home:  HomeScreen()
    );
  }
}