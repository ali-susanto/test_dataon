import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/common/routes.dart';
import 'package:test_dataon/view/home_screen.dart';
import 'package:test_dataon/view/login_screen.dart';
import 'package:test_dataon/view/profile_screen.dart';
import 'package:test_dataon/view/register_screen.dart';
import 'package:test_dataon/view/university_screen.dart';
import 'package:test_dataon/view_models/university_view_model.dart';
import 'package:test_dataon/view_models/user_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => UniversityViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
       routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/university': (context) => const UniversityScreen(),
          '/profile': (context) => const ProfileScreen()
        },
      home: const LoginScreen(),
    );
  }
}
