import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/view/profile_screen.dart';
import 'package:test_dataon/view_models/user_view_model.dart';
import 'package:test_dataon/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var vieModel = Provider.of<UserViewModel>(context);
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
                  leading: CircleAvatar(
                    child: Image.file(File(vieModel.user?.photo ?? '')),
                  ),
                  title: Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  ),
                  subtitle: Text(
                    vieModel.user?.fullName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            const SizedBox(
              height: 200,
            ),
            const Icon(
              Icons.school,
              size: 300,
            )
          ],
        ),
      )),
    );
  }
}
