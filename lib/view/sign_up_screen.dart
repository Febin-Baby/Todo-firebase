import 'package:flutter/material.dart';
import 'package:stripe_flutter/data/auth_data.dart';
import 'package:stripe_flutter/view/Sign_in_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
    focusNode3.addListener(() {
      setState(() {});
    });
    focusNode4.addListener(() {
      setState(() {});
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirempassword = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in screen'),
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
                customTextField(name, focusNode1, 'Name', Icons.person_2),
                const SizedBox(
                  height: 10,
                ),
                customTextField(email, focusNode2, 'Email', Icons.email),
                const SizedBox(
                  height: 20,
                ),
                customTextField(
                    password, focusNode3, 'Password', Icons.password),
                const SizedBox(
                  height: 20,
                ),
                customTextField(confirempassword, focusNode4,
                    'Confirm Password', Icons.password),
                txt(),
                registerButtun()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row txt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account"),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LginScreen(),
              ),
            );
          },
          child: const Text('Log-in'),
        ),
      ],
    );
  }

  Widget registerButtun() {
    return InkWell(
      onTap: () {
        NewAuth().register(
          name.text,
          email.text,
          password.text,
          confirempassword.text,
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
        child: const Text('Sign-in'),
      ),
    );
  }

  TextFormField customTextField(TextEditingController name, FocusNode focusNode,
      String hinttext, IconData iconData) {
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
