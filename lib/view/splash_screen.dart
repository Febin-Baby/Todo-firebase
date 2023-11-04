import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stripe_flutter/utils/const.dart';
import 'package:stripe_flutter/view/Sign_in_screen.dart';
import 'package:stripe_flutter/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    Future<void> checkUserSignIn() async {
      await Future.delayed(const Duration(milliseconds: 3000));
      if (auth.currentUser?.uid != null) {
        Get.off(HomeScreen());
      } else {
        Get.off(LginScreen());
      }
    }

    checkUserSignIn();
    return Scaffold(
      body: SizedBox(
        height: hieght,
        child: Image.asset(
          'assets/images/todo_splash.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
