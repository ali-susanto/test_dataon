import 'package:flutter/material.dart';
import 'package:test_dataon/view/profile_screen.dart';
import 'package:test_dataon/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen())),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  ),
                  subtitle: const Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
