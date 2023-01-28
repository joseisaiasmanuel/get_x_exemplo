import 'package:get/get.dart';

class ValueController extends GetxController {

  String definedValue = '';
  bool isLoading= false;

Future<void>  setValue(String value) async{
  isLoading= true;
   update();
await  Future.delayed( const Duration(seconds:2));
  definedValue = value;
  isLoading = false;
  update();
}



}