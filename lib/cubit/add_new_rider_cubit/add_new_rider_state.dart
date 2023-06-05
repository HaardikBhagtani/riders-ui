part of 'add_new_rider_cubit.dart';

enum AddNewRiderStatus { initial, submit, success, error }

enum UploadDocumentStatus { initial, loading, success, error }

class AddNewRiderState extends Equatable {
  final AddNewRiderStatus status;
  final UploadDocumentStatus documentStatus;
  final TextEditingController nameController,
      phoneNumberController,
      currentAddressController,
      currentPincodeController,
      bankAccountNumberController,
      ifscNumberController;
  final List<String> localites;
  final String aadhar, panCard, dl, bankCheque, photo;
  final String validator;

  const AddNewRiderState(
      {required this.status,
      required this.nameController,
      required this.phoneNumberController,
      required this.currentAddressController,
      required this.currentPincodeController,
      required this.bankAccountNumberController,
      required this.ifscNumberController,
      required this.localites,
      required this.aadhar,
      required this.documentStatus,
      required this.panCard,
      required this.dl,
      required this.bankCheque,
      required this.photo,
      required this.validator});

  factory AddNewRiderState.initial() {
    return AddNewRiderState(
      status: AddNewRiderStatus.initial,
      nameController: TextEditingController(),
      phoneNumberController: TextEditingController(),
      currentAddressController: TextEditingController(),
      currentPincodeController: TextEditingController(),
      bankAccountNumberController: TextEditingController(),
      ifscNumberController: TextEditingController(),
      localites: const [],
      aadhar: '',
      panCard: '',
      dl: '',
      bankCheque: '',
      photo: '',
      documentStatus: UploadDocumentStatus.initial,
      validator: '',
    );
  }

  AddNewRiderState copyWith(
      {AddNewRiderStatus? status,
      UploadDocumentStatus? documentStatus,
      TextEditingController? nameController,
      TextEditingController? phoneNumberController,
      TextEditingController? currentAddressController,
      TextEditingController? currentPincodeController,
      TextEditingController? bankAccountNumberController,
      TextEditingController? ifscNumberController,
      List<String>? localites,
      String? aadhar,
      String? panCard,
      String? dl,
      String? bankCheque,
      String? photo,
      String? validator}) {
    return AddNewRiderState(
      status: status ?? this.status,
      nameController: nameController ?? this.nameController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      currentAddressController:
          currentAddressController ?? this.currentAddressController,
      currentPincodeController:
          currentPincodeController ?? this.currentPincodeController,
      bankAccountNumberController:
          bankAccountNumberController ?? this.bankAccountNumberController,
      ifscNumberController: ifscNumberController ?? this.ifscNumberController,
      localites: localites ?? this.localites,
      aadhar: aadhar ?? this.aadhar,
      panCard: panCard ?? this.panCard,
      dl: dl ?? this.dl,
      bankCheque: bankCheque ?? this.bankCheque,
      documentStatus: documentStatus ?? this.documentStatus,
      photo: photo ?? this.photo,
      validator: validator ?? this.validator,
    );
  }

  @override
  List<Object?> get props => [
        status,
        documentStatus,
        nameController,
        phoneNumberController,
        currentAddressController,
        currentPincodeController,
        bankAccountNumberController,
        ifscNumberController,
        localites,
        aadhar,
        dl,
        panCard,
        photo,
        bankCheque,
        validator,
      ];
}
