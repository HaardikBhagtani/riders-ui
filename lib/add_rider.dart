import 'package:flutter/material.dart';
import 'package:riders_ui/upload_documents.dart';
import 'package:riders_ui/widgets/custom_button.dart';
import 'package:riders_ui/widgets/custom_multiselect_dropdown.dart';
import 'package:riders_ui/widgets/custom_textfield.dart';

class AddRider extends StatelessWidget {
  const AddRider({Key? key}) : super(key: key);

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
                'Add New Rider',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            CustomTextField(
              title: "Name",
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              errorText: null,
            ),
            CustomTextField(
              title: "Phone Number",
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
              maxLength: 9,
              errorText: null,
            ),
            CustomMultiSelectDropdown(
              label: 'Localities',
              selectedValues: [],
              dropdownList: ['Kanpur', 'Lucknow'],
              handleOnChange: (List) {},
            ),
            CustomTextField(
              title: "Current Address",
              controller: TextEditingController(),
              keyboardType: TextInputType.streetAddress,
              errorText: null,
            ),
            CustomTextField(
              title: "Current Pincode",
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              maxLength: 6,
              errorText: null,
            ),
            CustomTextField(
              title: "Bank Account Number",
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              errorText: null,
            ),
            CustomTextField(
              title: "IFSC Number",
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              errorText: null,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  CustomButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadDocuments()));
                    },
                    title: 'Next',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
