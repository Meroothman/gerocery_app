import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final supabase = Supabase.instance.client;
 Future <void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    final response = await supabase.auth.signUp(
      password: password,
      email: email,
      data: {"username": userName},
    );
    if (response.user == null) {
      throw Exception("Sign Up Failed");
    }
  }

  Future <void> login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

Future <void> logOut()async {
    await supabase.auth.signOut();
  }
}
