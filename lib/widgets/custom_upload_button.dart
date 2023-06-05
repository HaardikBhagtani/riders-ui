import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

import 'helpers.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({
    Key? key,
    required this.title,
    required this.handleOnAdd,
    required this.imageAdded,
    required this.imagePath,
  }) : super(key: key);
  final String title;
  final Function(String) handleOnAdd;
  final bool imageAdded;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: imageAdded, onChanged: (value) {}),
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
                InkWell(
                  onTap: () {
                    if (!imageAdded) return;
                    final imageProvider = Image.file(File(imagePath)).image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: const [
                        Text(
                          "View",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    String imageData = await imgFromCamera(title);
                    handleOnAdd(imageData);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide())),
                    child: Column(
                      children: const [
                        Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
