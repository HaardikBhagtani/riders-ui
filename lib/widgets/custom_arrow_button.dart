import 'package:flutter/material.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({Key? key, required this.onTap, required this.iconData}) : super(key: key);
  final void Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(6)),
        child: Icon(iconData),
      ),
    );
  }
}
