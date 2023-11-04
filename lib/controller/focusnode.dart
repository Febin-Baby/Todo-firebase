import 'package:get/get.dart';

class FocusNodee extends GetxController {
  var focusNode1 = false.obs;
  var focusNode2 = false.obs;

  void change1Focus() {
    focusNode1.value = !focusNode1.value;
  }

  void change2Focus() {
    focusNode2.value = !focusNode2.value;
  }
}
