// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stripe_flutter/controller/update_cpntroller.dart';
import 'package:stripe_flutter/services/firebase.dart';
import 'package:stripe_flutter/view/home_screen.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  EditScreen({
    Key? key,
    required this.tittle,
    required this.subtittle,
    required this.id,
  }) : super(key: key);
  final String tittle;
  final String subtittle;
  final String id;
  final TextEditingController ti = TextEditingController();

  final TextEditingController sub = TextEditingController();

  // @override
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  final UpdateController controller = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    controller.assignValues(tittle, subtittle);
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Update note'),
            const SizedBox(
              height: 30,
            ),
            customTextField(
              controller.updateName,
              focusNode1,
              'Tittle',
              Icons.note_add,
            ),
            const SizedBox(
              height: 14,
            ),
            customTextField(
              controller.updateSubttitle,
              focusNode2,
              'Subtittle',
              Icons.description,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(170, 30),
                  ),
                  onPressed: () {
                    FirebaseServices().update(controller.updateName.text,
                        controller.updateSubttitle.text, id, false);
                  },
                  child: const Text('Edited'),
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
            )
          ],
        ),
      ),
    );
  }

  TextFormField customTextField(
    TextEditingController name,
    FocusNode focusNode,
    String hinttext,
    IconData iconData,
  ) {
    return TextFormField(
      focusNode: focusNode,
      controller: name,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: focusNode.hasFocus ? Colors.red : Colors.yellow,
        ),
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(width: 1, color: Colors.amber),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
