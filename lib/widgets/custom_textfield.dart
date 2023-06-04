import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title, required this.controller, required this.keyboardType, this.maxLength, required this.errorText}) : super(key:
  key);
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 20),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLength: maxLength,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(),
              errorText: errorText,
              counter: const SizedBox.shrink()
            ),
          ),
        )
      ],
    );
  }
}
