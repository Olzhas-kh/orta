part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//Register User State
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailed extends AuthState {
  final String failedText;

  RegisterFailed({required this.failedText});
}


//Login User State
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailed extends AuthState {
  final String failedText;

  LoginFailed({required this.failedText});
}
