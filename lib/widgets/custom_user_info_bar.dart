import 'package:flutter/material.dart';

class CustomUserInfoBar extends StatelessWidget {
  const CustomUserInfoBar(
      {super.key, required this.userInfoType, required this.userData});
  final String userInfoType;
  final String userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            userInfoType,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
            child: Text(
              userData,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
