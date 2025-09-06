import 'package:ai_sys/Models/UserModel.dart';
import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final String token;
  final User user;
  Map<String, dynamic>? studentInfo;

  LoginSuccess(
      {required this.token, required this.user, required this.studentInfo});
}

class LoginError extends AuthStates {
  final String message;
  LoginError(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginValidationError extends AuthStates {
  final String message;
  LoginValidationError(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutLoading extends AuthStates {}

class LogoutSuccess extends AuthStates {
  final String message;
  LogoutSuccess(this.message);

  
}

class LogoutError extends AuthStates {
  final String message;
  LogoutError(this.message);
}
