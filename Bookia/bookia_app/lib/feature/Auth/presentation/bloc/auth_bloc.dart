import 'package:bookia_app/feature/Auth/data/Repo/auth_repo.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/services/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
    on<LogoutEvent>(logout);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());

    try {
      final result = await AuthRepo.register(event.params); // Async call

      if (result != null) {
        emit(RegisterSuccessState()); // Emitting success state
      } else {
        emit(RegisterFailureState("Something went wrong"));
      }
    } catch (e) {
      emit(RegisterFailureState(
          "Error: ${e.toString()}")); // Emitting failure state
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    try {
      final result = await AuthRepo.login(
        email: event.email,
        password: event.password,
      ); // Async call

      if (result != null) {
        emit(LoginSuccessState()); // Emitting success state
        LocalStorage.cacheData(
            key: LocalStorage.token, value: result.data?.token);
      } else {
        emit(LoginFailureState("Something went wrong"));
      }
    } catch (e) {
      emit(LoginFailureState(
          "Error: ${e.toString()}")); // Emitting failure state
    }
  }

  

  Future<void> logout(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(LogoutLoadingState());

    try {
      bool? value = await AuthRepo.logout();

      if (value == true) {
        emit(LogoutSuccessState());
      } else {
        emit(LogoutFailureState("Something went wrong"));
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(LogoutFailureState("Error: ${e.toString()}"));
    }
  }

}

