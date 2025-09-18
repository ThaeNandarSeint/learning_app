import 'package:equatable/equatable.dart';
import 'package:learning_app/features/user/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStateEvent extends AuthEvent {
  final UserModel? user;

  const AuthStateEvent(this.user);

  @override
  List<Object> get props => [?user];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final Role role;

  const RegisterEvent({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
  });

  @override
  List<Object> get props => [email, password, fullName, role];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends AuthEvent {
  final String email;

  const LogoutEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class UpdateProfileEvent extends AuthEvent {
  final String fullName;
  final String photoUrl;

  const UpdateProfileEvent({required this.fullName, required this.photoUrl});

  @override
  List<Object> get props => [fullName, photoUrl];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  const ForgotPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}
