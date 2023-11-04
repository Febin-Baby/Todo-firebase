import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:stripe_flutter/model/user_model.dart';
import 'package:stripe_flutter/utils/const.dart';
import 'package:stripe_flutter/view/Sign_in_screen.dart';
import 'package:stripe_flutter/view/home_screen.dart';

class NewAuth {
// Sign up
  Future<void> register(
    String name,
    String email,
    String password,
    String secondPassword,
  ) async {
    if (password == secondPassword) {
      try {
        // Create a UserRegistration object
        final userRegistration = UserRegistration(name: name, email: email);

        // Register the user with Firebase
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.off(HomeScreen());
        // If user creation is successful, you can store additional data using Firebase Firestore or Realtime Database
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser?.email)
            .collection('userendentials')
            .add(userRegistration.toMap());
      } on FirebaseException catch (e) {
        Get.snackbar('Registration Failed', e.toString());
      }
    }
  }

// Log in
  Future<void> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.off(HomeScreen());
    } catch (e) {
      print('Log in error: $e');
    }
  }

  logout() async {
    try {
      await auth.signOut();
      Get.off(LginScreen());
    } catch (e) {
      Get.snackbar('error', '');
    }
  }
}
