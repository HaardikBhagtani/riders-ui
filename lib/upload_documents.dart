import 'package:flutter/material.dart';
import 'package:riders_ui/widgets/custom_button.dart';
import 'package:riders_ui/widgets/custom_upload_button.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
                  child: Text(
                    'Upload Documents',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                const CustomUploadButton(title: 'Aadhar',),
                const CustomUploadButton(title: 'PAN Card',),
                const CustomUploadButton(title: 'DL',),
                const CustomUploadButton(title: 'Bank Cheque',),
                const CustomUploadButton(title: 'Photo',),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRider()));
                        },
                        title: 'Back',
                      ),
                      CustomButton(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRider()));
                        },
                        title: 'Save',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}