import 'package:flutter/material.dart';
import 'package:stripe_flutter/data/auth_data.dart';
import 'package:stripe_flutter/view/sign_up_screen.dart';

class LginScreen extends StatelessWidget {
  LginScreen({super.key});

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login_in screen'),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .4,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Unknown copy.jpeg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                customTextField(email, 'Email', Icons.person_2),
                const SizedBox(
                  height: 10,
                ),
                customTextField(password, 'password', Icons.email),
                const SizedBox(
                  height: 20,
                ),
                txt(context),
                loginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row txt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont't have an account"),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text('Sign-in'),
        ),
      ],
    );
  }

  InkWell loginButton() {
    return InkWell(
      onTap: () {
        NewAuth().logIn(
          email.text.trim(),
          password.text.trim(),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.green,
        ),
        child: const Text('Log-in'),
      ),
    );
  }

  TextFormField customTextField(
    TextEditingController name,
    String hinttext,
    IconData iconData,
  ) {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          // color: focusNode.hasFocus ? Colors.red : Colors.yellow,
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
