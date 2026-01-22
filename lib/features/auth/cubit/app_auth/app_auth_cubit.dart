import 'package:bloc/bloc.dart';
import 'package:grocesry_app/features/auth/data/services/auth_services.dart';

part 'app_auth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  AppAuthCubit() : super(AppAuthInitial());
  final AuthServices authServices = AuthServices();

  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(AppAuthLoading());
    try {
      await authServices.signUp(
        email: email,
        password: password,
        userName: userName,
      );
      emit(AppAuthSuccess());
    } catch (e) {
      emit(AppAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AppAuthLoading());

    try {
      await authServices.login(email: email, password: password);
      emit(AppAuthSuccess());
    } catch (e) {
      emit(AppAuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(AppAuthLoading());
    await authServices.logOut();
    emit(AppAuthSuccess());
  }
}
