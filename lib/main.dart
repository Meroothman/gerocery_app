import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/features/auth/cubit/app_auth/app_auth_cubit.dart';
import 'package:grocesry_app/features/auth/presentation/screens/on_board_screen.dart';
import 'package:grocesry_app/features/cart/cubit/cart_cubit.dart';
import 'package:grocesry_app/features/home/cubit/product_cubit.dart';
import 'package:grocesry_app/features/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://dkwtqnvuuzgqaqprnbdi.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrd3RxbnZ1dXpncWFxcHJuYmRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk3MjgxODAsImV4cCI6MjA4NTMwNDE4MH0.wPGEMAPX9RnpSFaCBR6nel0eYxBfLDJoiS2C4qDbVHs",
  );

  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppAuthCubit()),
        BlocProvider(create: (context) => ProductCubit()..getProducts()),
        BlocProvider(create: (context) => CartCubit()..getCartItems()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grocery App",
        home: user == null ? OnBoardScreen() : HomeScreen(),
      ),
    );
  }
}
