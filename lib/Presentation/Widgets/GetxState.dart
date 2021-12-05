import 'package:get/get.dart';

class listMang extends GetxController {
  List<bool> descTextShowFlag = [true].obs;

  void change(index) {
      descTextShowFlag[index]=!descTextShowFlag[index];
  }
}