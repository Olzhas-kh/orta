part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

//Register User Event
class RegisterEvent extends AuthEvent {
  final String email;
  final String name;
  final String birthDay;
  final String password;
  final String city;
  final List<String> interest;
  final bool gender;

  RegisterEvent(
      {required this.email,
      required this.name,
      required this.birthDay,
      required this.password,
      required this.city,
      required this.interest,
      required this.gender});
}

//Login User Event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
