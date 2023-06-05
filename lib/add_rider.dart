import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_ui/cubit/add_new_rider_cubit/add_new_rider_cubit.dart';
import 'package:riders_ui/widgets/custom_button.dart';
import 'package:riders_ui/widgets/custom_multiselect_dropdown.dart';
import 'package:riders_ui/widgets/custom_textfield.dart';

class AddRider extends StatelessWidget {
  const AddRider({Key? key}) : super(key: key);

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
                  'Add New Rider',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              CustomTextField(
                title: "Name",
                controller: state.nameController,
                keyboardType: TextInputType.name,
                errorText: state.validator == 'name' ? 'Required' : null,
              ),
              CustomTextField(
                title: "Phone Number",
                controller: state.phoneNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 9,
                errorText: state.validator == 'phoneNumber'
                    ? 'Required'
                    : state.validator == 'not9'
                        ? 'Enter 9 digit phone number'
                        : null,
              ),
              CustomMultiSelectDropdown(
                label: 'Localities',
                selectedValues: [...state.localites],
                dropdownList: const ['Delhi', 'Noida', "Ghaziabad"],
                handleOnChange: (List<String> local) {
                  context.read<AddNewRiderCubit>().setLocalites(local);
                },
                errorText: state.validator == 'localities' ? 'Required' : null,
              ),
              CustomTextField(
                title: "Current Address",
                controller: state.currentAddressController,
                keyboardType: TextInputType.streetAddress,
                errorText:
                    state.validator == 'currentAddress' ? 'Required' : null,
              ),
              CustomTextField(
                title: "Current Pincode",
                controller: state.currentPincodeController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                errorText: state.validator == 'currentPincode'
                    ? 'Required'
                    : state.validator == 'not6'
                        ? 'Enter 6 digit pincode'
                        : null,
              ),
              CustomTextField(
                title: "Bank Account Number",
                controller: state.bankAccountNumberController,
                keyboardType: TextInputType.number,
                errorText:
                    state.validator == 'bankAccountNumber' ? 'Required' : null,
              ),
              CustomTextField(
                title: "IFSC Number",
                controller: state.ifscNumberController,
                keyboardType: TextInputType.number,
                errorText: state.validator == 'ifscNumber' ? 'Required' : null,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(''),
                    CustomButton(
                      onTap: () {
                        context
                            .read<AddNewRiderCubit>()
                            .verifyNewRiderDetails(context);
                      },
                      title: 'Next',
                    )
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
