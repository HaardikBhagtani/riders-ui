import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riders_ui/cubit/rider_cubit/rider_cubit.dart';
import 'package:riders_ui/home_page.dart';
import 'package:riders_ui/models/user_details.dart';
import 'package:riders_ui/upload_documents.dart';
part 'add_new_rider_state.dart';

class AddNewRiderCubit extends Cubit<AddNewRiderState> {
  AddNewRiderCubit() : super(AddNewRiderState.initial());

  void setLocalites(List<String> newLocalities) {
    emit(state.copyWith(localites: newLocalities));
  }

  void verifyNewRiderDetails(BuildContext context) {
    if (state.nameController.text.isEmpty) {
      emit(state.copyWith(validator: 'name'));
    } else if (state.phoneNumberController.text.isEmpty) {
      emit(state.copyWith(validator: 'phoneNumber'));
    } else if (state.phoneNumberController.text.length < 9) {
      emit(state.copyWith(validator: 'not9'));
    } else if (state.localites.isEmpty) {
      emit(state.copyWith(validator: 'localities'));
    } else if (state.currentAddressController.text.isEmpty) {
      emit(state.copyWith(validator: 'currentAddress'));
    } else if (state.currentPincodeController.text.isEmpty) {
      emit(state.copyWith(validator: 'currentPincode'));
    } else if (state.currentPincodeController.text.length < 6) {
      emit(state.copyWith(validator: 'not6'));
    } else if (state.bankAccountNumberController.text.isEmpty) {
      emit(state.copyWith(validator: 'bankAccountNumber'));
    } else if (state.ifscNumberController.text.isEmpty) {
      emit(state.copyWith(validator: 'ifscNumber'));
    } else {
      emit(state.copyWith(validator: ''));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const UploadDocuments()));
    }
  }

  void setAadhar(String image) {
    emit(state.copyWith(aadhar: image));
  }

  void setDl(String image) {
    emit(state.copyWith(dl: image));
  }

  void setPhoto(String image) {
    emit(state.copyWith(photo: image));
  }

  void setPanCard(String image) {
    emit(state.copyWith(panCard: image));
  }

  void setBankCheque(String image) {
    emit(state.copyWith(bankCheque: image));
  }

  void verifyUploadedDocuments(BuildContext context) {
    if (state.aadhar.isEmpty) {
      Fluttertoast.showToast(msg: 'Aadhar Required');
    } else if (state.panCard.isEmpty) {
      Fluttertoast.showToast(msg: 'PAN Card Required');
    } else if (state.dl.isEmpty) {
      Fluttertoast.showToast(msg: 'DL Required');
    } else if (state.bankCheque.isEmpty) {
      Fluttertoast.showToast(msg: 'Bank Cheque Required');
    } else if (state.photo.isEmpty) {
      Fluttertoast.showToast(msg: 'Photo Required');
    } else {
      UserDetail user = UserDetail(
          nameController: state.nameController,
          phoneNumberController: state.phoneNumberController,
          currentAddressController: state.currentAddressController,
          currentPincodeController: state.currentPincodeController,
          bankAccountNumberController: state.bankAccountNumberController,
          ifscNumberController: state.ifscNumberController,
          localites: state.localites,
          aadhar: state.aadhar,
          dl: state.dl,
          panCard: state.panCard,
          bankCheque: state.bankCheque,
          photo: state.photo);
      context.read<RiderCubit>().addNewRider(user);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    }
  }
}
