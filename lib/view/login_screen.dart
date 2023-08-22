// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/common/routes.dart';
import 'package:test_dataon/view_models/user_view_model.dart';
import 'package:test_dataon/widgets/custom_button.dart';
import 'package:test_dataon/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userName = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 120,
                  color: Colors.blueAccent,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    headingText: 'Username',
                    hintText: 'masukkan username',
                    controller: _userName),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  headingText: 'Password',
                  hintText: 'masukkan password',
                  controller: _pass,
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomButton(
                      size: size,
                      color: Colors.blueAccent,
                      text: 'Login',
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        await viewModel.login(_userName.text, _pass.text);
                        if (viewModel.valid) {
                          Navigator.pushReplacementNamed(context, Routes.home);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('User Tidak Ditemukan'),
                                );
                              });
                        }
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum punya akun?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: const Text('Register',))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
