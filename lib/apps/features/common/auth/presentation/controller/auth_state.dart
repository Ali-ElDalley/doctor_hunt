import 'package:equatable/equatable.dart';

abstract class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthCubitState {
  const AuthInitial();
}

class AuthLoading extends AuthCubitState {
  const AuthLoading();
}

class AuthSuccess extends AuthCubitState {
  const AuthSuccess();
}

class AuthFailure extends AuthCubitState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
