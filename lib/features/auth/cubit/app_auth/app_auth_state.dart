part of 'app_auth_cubit.dart';


abstract class AppAuthState {}

class AppAuthInitial extends AppAuthState {}

class AppAuthLoading extends AppAuthState {}

class AppAuthSuccess extends AppAuthState {}

class AppAuthFailure extends AppAuthState {
  final String errorMessage;
  AppAuthFailure({required this.errorMessage});
}
