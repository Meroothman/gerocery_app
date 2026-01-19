import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_auth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  AppAuthCubit() : super(AppAuthInitial());

  
}
