import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:test_dataon/models/user_model.dart';
import 'package:test_dataon/view_models/user_view_model.dart';
import 'package:test_dataon/widgets/custom_button.dart';
import 'package:test_dataon/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullName = TextEditingController();
  final _userName = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? file;
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  Icons.person_add,
                  size: 80,
                  color: Colors.blueAccent,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    headingText: 'Nama Lengkap',
                    hintText: 'masukkan nama lengkap',
                    controller: _fullName),
                const SizedBox(
                  height: 16,
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
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            width: size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        final camera = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality:
                                                    50, // <- Reduce Image quality
                                                maxHeight:
                                                    500, // <- reduce the image size
                                                maxWidth: 500);
                                        if (camera!.path.isNotEmpty) {
                                          final Directory path =
                                              await getApplicationDocumentsDirectory();
                                          File cameraPath = File(camera.path);

                                          String date =
                                              DateFormat('yyyy-MM-dd-HH:MM')
                                                  .format(DateTime.now());
                                          var imageNewPath = await cameraPath.copy(
                                              "${path.path}/${'${_userName.text}-$date'}.png");

                                          debugPrint(path.toString());
                                          debugPrint(
                                              "new path : $imageNewPath");
                                          setState(() {
                                            file = File(camera.path);
                                            Navigator.pop(context);
                                          });
                                        }
                                      } on PlatformException catch (e) {
                                        throw Exception(
                                            'Failed to pick image : $e');
                                      }
                                    },
                                    child: const Text('Galeri')),
                                const SizedBox(
                                  height: 12,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        final camera = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera,
                                                imageQuality:
                                                    50, // <- Reduce Image quality
                                                maxHeight:
                                                    500, // <- reduce the image size
                                                maxWidth: 500);
                                        if (camera!.path.isNotEmpty) {
                                          final Directory path =
                                              await getApplicationDocumentsDirectory();
                                          File cameraPath = File(camera.path);

                                          String date =
                                              DateFormat('yyyy-MM-dd-HH:MM')
                                                  .format(DateTime.now());
                                          var imageNewPath = await cameraPath.copy(
                                              "${path.path}/${'${_userName.text}-$date'}.png");

                                          debugPrint(path.toString());
                                          debugPrint(
                                              "new path : $imageNewPath");
                                          setState(() {
                                            file = File(camera.path);
                                            Navigator.pop(context);
                                          });
                                        }
                                      } on PlatformException catch (e) {
                                        throw Exception(
                                            'Failed to pick image : $e');
                                      }
                                    },
                                    child: const Text('Camera')),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      file?.path ?? 'Upload Foto Profil',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                    size: size,
                    color: Colors.blueAccent,
                    text: 'Register',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      if (file!.path.isEmpty) return;
                      var user = User(
                          userName: _userName.text,
                          password: _pass.text,
                          fullName: _fullName.text,
                          photo: file!.path);
                      viewModel.register(user);
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
