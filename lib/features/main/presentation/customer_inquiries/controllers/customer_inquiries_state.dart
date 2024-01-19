import 'dart:io';

import '/index.dart';

class CustomerInquiriesState extends Equatable {
  const CustomerInquiriesState({
    required this.complaint,
    this.selectedImage,
    this.rx = RequestState.none,
    required this.formKey,
    this.selectedService,
  });
  final TextEditingController complaint;
  final CategoriesEntity? selectedService;
  final Rx<File?>? selectedImage;
  final GlobalKey<FormState> formKey;
  final RequestState rx;

  CustomerInquiriesState copyWith({
    String? complaint,
    Rx<File?>? selectedImage,
    GlobalKey<FormState>? formKey,
    CategoriesEntity? selectedService,
    RequestState? rx,
  }) =>
      CustomerInquiriesState(
        complaint:
            TextEditingController(text: complaint ?? this.complaint.text),
        selectedImage: selectedImage ?? this.selectedImage,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
        selectedService: selectedService ?? this.selectedService,
      );
  @override
  List<Object?> get props => [
        complaint,
        selectedService,
        selectedImage,
        formKey,
        rx,
      ];
}
