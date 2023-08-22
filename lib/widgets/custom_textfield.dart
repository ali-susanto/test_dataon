import 'package:flutter/material.dart';
import 'package:test_dataon/common/styles.dart';

class CustomTextField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextField(
      {Key? key,
      required this.headingText,
      required this.hintText,
      this.obsecureText = false,
      this.suffixIcon,
      this.textInputType,
      this.textInputAction,
      required this.controller,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headingText,
            style: Styles.textFieldHeading,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            maxLines: maxLines,
            controller: controller,
            textInputAction: textInputAction ?? TextInputAction.none,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: obsecureText,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Data tidak boleh kosong';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Styles.textFieldHintStyle,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueAccent)),
                suffixIcon: suffixIcon ?? const SizedBox()),
          )
        ],
      ),
    );
  }
}
