import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/core/enum/user_type_enum.dart';
import 'package:se7ety/core/services/local_storage.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_event.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);

      if (event.userType == UserType.patient) {
        await FirebaseFirestore.instance
            .collection("Patients")
            .doc(user?.uid)
            .set({
          "uid": user?.uid,
          "name": event.name,
          "email": event.email,
          "password": event.password,
          "userType": event.userType,
          "age": "",
          "phone": "",
          "city": "",
          "image": "",
          "bio": ""
        });
      } else {
        await FirebaseFirestore.instance
            .collection("Doctors")
            .doc(user?.uid)
            .set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
        });
      }

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(AuthErrorState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(AuthErrorState('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
    }
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
       final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
        User? user = credential.user;
      AppLocalStorage.cacheData(
          key: AppLocalStorage.userToken, value: credential.user!.uid);

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(AuthErrorState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(AuthErrorState('Wrong password provided for that user.'));
      }
    }
  }
}
