import 'package:flutter/material.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                    value: true,
                    onChanged: (value) {

                    }),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Text(
                        "View",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(), right: BorderSide(), bottom: BorderSide())),
                  child: Column(
                    children: [
                      Text(
                        "Add",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
