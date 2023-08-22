import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/common/routes.dart';
import 'package:test_dataon/view_models/user_view_model.dart';
import 'package:test_dataon/widgets/custom_bottom_navbar.dart';
import 'package:test_dataon/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          Column(
            children: [
              AvatarGlow(
                endRadius: 110,
                glowColor: Colors.black,
                duration: const Duration(seconds: 2),
                child: Container(
                    margin: const EdgeInsets.all(15),
                    width: 175,
                    height: 175,
                    child: Image.file(File(viewModel.user?.photo ?? ''))),
              ),
              const Text(
                '',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: ListTile(
                        title: const Text(
                          'Nama',
                          style: TextStyle(fontSize: 12),
                        ),
                        horizontalTitleGap: 25,
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            viewModel.user?.fullName ?? '',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: ListTile(
                        title: const Text(
                          'UserName',
                          style: TextStyle(fontSize: 12),
                        ),
                        horizontalTitleGap: 25,
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            viewModel.user?.userName ?? '',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: ListTile(
                        title: const Text(
                          'Password',
                          style: TextStyle(fontSize: 12),
                        ),
                        horizontalTitleGap: 25,
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            viewModel.user?.password ?? '',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                        size: size,
                        color: Colors.red,
                        text: 'Sign Out',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
