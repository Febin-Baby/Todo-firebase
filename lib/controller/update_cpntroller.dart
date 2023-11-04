import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  final TextEditingController updateName = TextEditingController();
  final TextEditingController updateSubttitle = TextEditingController();
  void assignValues(String name, String subtittle) {
    updateName.text = name;
    updateSubttitle.text = subtittle;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
