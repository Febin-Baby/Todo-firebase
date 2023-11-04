import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_flutter/services/firebase.dart';
import 'package:stripe_flutter/view/home_screen.dart';

import '../controller/focusnode.dart';

// ignore: must_be_immutable
class AddScreesnNote extends StatelessWidget {
  AddScreesnNote({super.key});

  TextEditingController tittle = TextEditingController();
  TextEditingController subtittle = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  final FocusNodee controller = Get.put(FocusNodee());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Add new note",
              style: TextStyle(fontSize: 21),
            ),
            const SizedBox(
              height: 14,
            ),
            Obx(
              () => customTextField(
                tittle,
                controller.focusNode1,
                'Tittle',
                Icons.note_add,
                1,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Obx(
              () => customTextField(
                subtittle,
                controller.focusNode2,
                'Subtittle',
                Icons.description,
                3,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            //const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(170, 30)),
                  onPressed: () {
                    if (subtittle.text.isNotEmpty && tittle.text.isNotEmpty) {
                      FirebaseServices()
                          .createNotes(tittle.text, subtittle.text);
                      Get.back();
                    }
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    minimumSize: const Size(170, 30),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField customTextField(TextEditingController name, RxBool focusNode,
      String hinttext, IconData iconData, int? maxLines) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: name,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: focusNode.value ? Colors.red : Colors.yellow,
        ),
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.greenAccent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
