import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orta/services/firebase_methods/auth_methods.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //Register User Logic
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await AuthMethods().signUpUser(
            email: event.email,
            password: event.password,
            name: event.name,
            interest: event.interest,
            gender: event.gender,
            birthDay: event.birthDay,
            city: event.city);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailed(failedText: e.toString()));
      }
    });

    //Login User Logic
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await AuthMethods()
            .signInUser(email: event.email, password: event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailed(failedText: e.toString()));
      }
    });
  }
}
