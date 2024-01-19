import 'dart:io';

import '/index.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.name,
    required this.formKey,
    required this.email,
    required this.phoneController,
    required this.userdata,
    this.isCorrectPhone = true,
    this.phone = "",
    this.codeCountry = "+965",
    this.selectedImage,
    // this.phoneNumber,
    this.rx = RequestState.none,
  });
  final TextEditingController name, email, phoneController;
  final GlobalKey<FormState> formKey;
  final String phone, codeCountry;
  final Rx<File?>? selectedImage;
  // final PhoneNumber? phoneNumber;
  final AuthenticationEntity? userdata;
  final RequestState rx;
  final bool isCorrectPhone;

  ProfileState copyWith({
    String? name,
    String? email,
    String? phoneContr,
    String? phone,
    String? codeCountry,
    GlobalKey<FormState>? formKey,
    Rx<File?>? selectedImage,
    AuthenticationEntity? userdata,
    RequestState? rx,
    bool? isCorrectPhone,
    // PhoneNumber? phoneNumber,
  }) =>
      ProfileState(
        formKey: formKey ?? this.formKey,
        // phoneNumber: phoneNumber ?? this.phoneNumber,
        codeCountry: codeCountry ?? this.codeCountry,
        isCorrectPhone: isCorrectPhone ?? this.isCorrectPhone,
        phone: phone ?? this.phone,
        name: TextEditingController(text: name ?? this.name.text),
        email: TextEditingController(text: email ?? this.email.text),
        phoneController:
            TextEditingController(text: phoneContr ?? phoneController.text),
        selectedImage: selectedImage ?? this.selectedImage,
        userdata: userdata ?? this.userdata,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        // phoneNumber,
        codeCountry,
        name,
        userdata,
        formKey,
        selectedImage,
        phone,
        email,
        rx,
      ];
}
