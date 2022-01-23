import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/services/DatabaseService/local_db_service.dart';
import 'package:therapist/view/pages/Root/root_page.dart';
import 'package:therapist/view/pages/Welcome/welcome_page.dart';
import 'package:therapist/view/widgets/Dialogs/success_dialog.dart';

class AuthService {
  FirebaseAuth _authService = FirebaseAuth.instance;
  final _profileController = Get.find<ProfileController>();
  final LocalDBService _localDBService = LocalDBService();

  Future<bool> signUp(String email, String password) async {
    _profileController.changeLoading(loading: true);
    try {
      // ignore: unused_local_variable
      final UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      _profileController.updateUID(_authService.currentUser.uid);
      Dialogs.snackBar(
        title: 'Successfully',
        subTitle: 'You have successfully signed up with $email .',
        bgColor: Colors.greenAccent,
      );
      _profileController.changeLoading(loading: false);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Dialogs.snackBar(
          title: 'Weak Password',
          subTitle: 'The password provided is too weak.',
          bgColor: Colors.redAccent[100],
        );
        //  print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Dialogs.snackBar(
          title: 'Account Exists',
          subTitle: 'The account already exists for that email.',
          bgColor: Colors.redAccent[100],
        );
        // print('The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar(
        'Error while Sign Up',
        e.toString(),
      );
    }
    _profileController.changeLoading(loading: false);
    return false;
  }

  // ignore: type_annotate_public_apis
  signIn(String email, String password, bool isTherapist) async {
    _profileController.changeLoading(loading: true);

    try {
      // ignore: unused_local_variable
      final UserCredential userCredential = await _authService
          .signInWithEmailAndPassword(email: email, password: password);
      Dialogs.snackBar(
        title: 'Successfully',
        subTitle: 'You have successfully loged in with $email .',
        bgColor: Colors.greenAccent,
      );

      _localDBService.saveIsTherapist(isTherapist);
      _localDBService.saveIsLoggedIn(true);
      Get.offAll(
        () => RootPage(
          isTherapist: isTherapist,
        ),
      );
      _profileController.changeLoading(loading: false);

      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Dialogs.snackBar(
          title: 'User Not Found',
          subTitle: 'No user found for that email.',
          bgColor: Colors.redAccent[100],
        );
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Dialogs.snackBar(
          title: 'Wrong Password',
          subTitle: 'Wrong password provided for that user.',
          bgColor: Colors.redAccent[100],
        );
        //  print('Wrong password provided for that user.');
      }
    } catch (e) {
      Get.snackbar(
        'Error while Sign Up',
        e.toString(),
      );
    }
    _profileController.changeLoading(loading: false);
  }

  // ignore: type_annotate_public_apis
  signOut() async {
    try {
      await _authService.signOut();
      _localDBService.saveIsLoggedIn(false);

      Get.offAll(() => WelcomePage());
    } catch (e) {
      //  print(e.toString());
    }
  }
}
