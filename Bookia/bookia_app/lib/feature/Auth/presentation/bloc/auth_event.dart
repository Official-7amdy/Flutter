import 'package:bookia_app/feature/Auth/data/Models/request/register_params.dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  // Constructor only needs to accept the RegisterParams
  RegisterEvent(this.params);
}
