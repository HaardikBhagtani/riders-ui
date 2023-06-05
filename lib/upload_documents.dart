import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_ui/widgets/custom_button.dart';
import 'package:riders_ui/widgets/custom_upload_button.dart';

import 'cubit/add_new_rider_cubit/add_new_rider_cubit.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AddNewRiderCubit, AddNewRiderState>(
        builder: (context, state) {
      return SingleChildScrollView(
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
              CustomUploadButton(
                imageAdded: state.aadhar.isNotEmpty,
                title: 'Aadhar',
                imagePath: state.aadhar.isNotEmpty
                    ? state.aadhar.substring(0, state.aadhar.indexOf(':'))
                    : '',
                handleOnAdd: (value) {
                  context.read<AddNewRiderCubit>().setAadhar(value);
                },
              ),
              CustomUploadButton(
                imageAdded: state.panCard.isNotEmpty,
                title: 'PAN Card',
                imagePath: state.panCard.isNotEmpty
                    ? state.panCard.substring(0, state.panCard.indexOf(':'))
                    : '',
                handleOnAdd: (value) {
                  context.read<AddNewRiderCubit>().setPanCard(value);
                },
              ),
              CustomUploadButton(
                imageAdded: state.dl.isNotEmpty,
                title: "DL",
                imagePath: state.dl.isNotEmpty
                    ? state.dl.substring(0, state.dl.indexOf(':'))
                    : '',
                handleOnAdd: (value) {
                  context.read<AddNewRiderCubit>().setDl(value);
                },
              ),
              CustomUploadButton(
                imageAdded: state.bankCheque.isNotEmpty,
                title: 'Bank Cheque',
                imagePath: state.bankCheque.isNotEmpty
                    ? state.bankCheque
                        .substring(0, state.bankCheque.indexOf(':'))
                    : '',
                handleOnAdd: (value) {
                  context.read<AddNewRiderCubit>().setBankCheque(value);
                },
              ),
              CustomUploadButton(
                imageAdded: state.photo.isNotEmpty,
                title: 'Photo',
                imagePath: state.photo.isNotEmpty
                    ? state.photo.substring(0, state.photo.indexOf(':'))
                    : '',
                handleOnAdd: (value) {
                  context.read<AddNewRiderCubit>().setPhoto(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: 'Back',
                    ),
                    CustomButton(
                      onTap: () {
                        context
                            .read<AddNewRiderCubit>()
                            .verifyUploadedDocuments(context);
                      },
                      title: 'Save',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
