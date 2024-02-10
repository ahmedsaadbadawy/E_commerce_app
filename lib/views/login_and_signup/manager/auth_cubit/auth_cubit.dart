import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (password == admin) {
        prefs.setBool(kIsAdmin, true);
      }

      prefs.setBool(kKeepMeLoggedIn, true);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  Future<void> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(name);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure());
    }
  }
}
