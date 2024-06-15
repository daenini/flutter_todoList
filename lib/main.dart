import 'package:flutter/material.dart';
import 'package:my_app_project/provider/MemberProvider.dart';
import 'package:my_app_project/screens/home_screen.dart';
import 'package:my_app_project/screens/login/login_screen.dart';
import 'package:my_app_project/screens/login/signup_screen.dart';
import 'package:my_app_project/screens/splash_screen.dart';
import 'package:my_app_project/screens/todoList_screen.dart';
import 'package:my_app_project/screens/weather_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MemberProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App Project',
      initialRoute: "/intro",
      routes: {
        "/intro": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        "/todo": (context) => TodoListScreen(),
        "/weather": (context) => WeaterScreen(),
      },
      home: HomePage(),
    );
  }
}