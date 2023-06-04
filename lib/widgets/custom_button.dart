import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.title}) : super(key: key);
   final void Function() onTap;
   final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(6)),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
