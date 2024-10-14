import 'package:flutter/material.dart';
import 'package:cv_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2398F7)),
        useMaterial3: true,
        fontFamily: 'Roboto'
      ),
      home: const LoginPage(),
    );
  }
}