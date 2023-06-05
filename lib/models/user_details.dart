import 'package:flutter/material.dart';

class UserDetail {
  TextEditingController? nameController,
      phoneNumberController,
      currentAddressController,
      currentPincodeController,
      bankAccountNumberController,
      ifscNumberController;
  List<String>? localites;
  String? aadhar, panCard, dl, bankCheque, photo;

  UserDetail(
      {this.nameController,
      this.phoneNumberController,
      this.currentAddressController,
      this.currentPincodeController,
      this.bankAccountNumberController,
      this.ifscNumberController,
      this.localites,
      this.aadhar,
      this.panCard,
      this.dl,
      this.bankCheque,
      this.photo});
}
