import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:mostshary/view/home/home.dart';

part 'login_and_regester_state.dart';

class LoginAndRegesterCubit extends Cubit<LoginAndRegesterState> {
  LoginAndRegesterCubit() : super(LoginAndRegesterInitial());

  login({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(const MyHomePage());
    }).catchError((e) {
      if (e.code == 'user-not-found') {
        emit(FieldErrorState(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(FieldErrorState(error: 'Wrong password provided.'));
      }
    });
  }

  regester({required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.offAll(const MyHomePage());
    }).catchError((e) {
      if (e.code == 'weak-password') {
        emit(FieldErrorState(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(FieldErrorState(
            error: 'The account already exists for that email.'));
      }
    });
  }
}
