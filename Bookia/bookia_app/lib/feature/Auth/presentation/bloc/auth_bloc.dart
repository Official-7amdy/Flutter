import 'package:bookia_app/feature/Auth/data/Repo/auth_repo.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_event.dart';
import 'package:bookia_app/feature/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<RegisterEvent>(register);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    
    try {
      final result = await AuthRepo.register(event.params);  // Async call
      
      if (result != null) {
        emit(RegisterSuccessState());  // Emitting success state
      } else {
        emit(RegisterFailureState("Something went wrong"));
      }
    } catch (e) {
      emit(RegisterFailureState("Error: ${e.toString()}"));  // Emitting failure state
    }
  }
}
