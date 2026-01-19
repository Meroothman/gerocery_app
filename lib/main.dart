import 'package:flutter/material.dart';
import 'package:grocesry_app/features/auth/presentation/screens/on_board_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://gubxhsguqfghfqdpbxin.supabase.co",
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1Ynhoc2d1cWZnaGZxZHBieGluIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4NDU2NjgsImV4cCI6MjA4NDQyMTY2OH0.NkuPdIs_zPC7slGJIhWcRvjDr5cxbE0RYJyW8xP_X-c",
  );

  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grocery App",
      home: OnBoardScreen(),
    );
  }
}
