import 'dart:io';

import '/index.dart';
import 'customer_inquiries_state.dart';

abstract class CustomerInquiriesController extends GetxController {
  Future<void> pickPicture();
  cancelImg();
  void selectedService({required CategoriesEntity? service});
  Future<void> sendComplaint();
}

class CustomerInquiriesControllerImp extends CustomerInquiriesController {
  CustomerInquiriesControllerImp({required this.sendComplaintUseCase});
  static CustomerInquiriesControllerImp get to => Get.find();
  final SendComplaintUseCase sendComplaintUseCase;
  final Rx<CustomerInquiriesState> state = CustomerInquiriesState(
    complaint: TextEditingController(),
    formKey: GlobalKey<FormState>(),
  ).obs;

  @override
  Future<void> pickPicture() async {
    File? resultImg = await Utils.pickPicture();
    if (resultImg != null) {
      state(state.value.copyWith(selectedImage: resultImg.obs));
    }
  }

  @override
  cancelImg() => state(state.value.copyWith(selectedImage: null.obs));

  @override
  Future<void> sendComplaint() async {
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }
    state(state.value.copyWith(rx: handleRxLoading()));
    final result = await sendComplaintUseCase(
      SendComplaintParameter(
        categoryId: state.value.selectedService!.id,
        content: state.value.complaint.text,
        image: state.value.selectedImage?.value,
      ),
    );
    result.when(
      success: (data) {
        Get.back();
        toast(data.message);
        state(
          state.value.copyWith(
            rx: RequestState.success,
            complaint: "",
            selectedImage: null.obs,
            selectedService: null,
          ),
        );
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  @override
  void selectedService({required CategoriesEntity? service}) {
    if (service?.isActive == true) {
      state(state.value.copyWith(selectedService: service));
    }
  }
}
