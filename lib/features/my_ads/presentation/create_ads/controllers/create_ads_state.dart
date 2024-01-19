import 'dart:io';
import '/index.dart';

class CreateAdsState extends Equatable {
  final GlobalKey<FormState> formKey;
  final TextEditingController title, videoLink;
  final Rx<File?>? image;
  final bool isImageEmpty;
  final RequestState rx;
  final CategoriesEntity? selectedService;
  
  final MyAdsEntity? myAds;

  const CreateAdsState({
    required this.formKey,
    required this.title,
    required this.videoLink,
    required this.image,
    required this.isImageEmpty,
     this.rx=RequestState.none,
    this.selectedService,
    this.myAds,
  });

  CreateAdsState copyWith({
    GlobalKey<FormState>? formKey,
    String? title,
    String? videoLink,
    Rx<File?>? image,
    bool? isImageEmpty,
    RequestState? rx,
    CategoriesEntity? selectedService,
    MyAdsEntity? myAds,
  }) =>
      CreateAdsState(
        selectedService: selectedService ?? this.selectedService,
        formKey: formKey ?? this.formKey,
        title: this.title.copyWith(text: title),
        videoLink: this.videoLink.copyWith(text: videoLink),
        image: image ?? this.image,
        isImageEmpty: isImageEmpty ?? this.isImageEmpty,
        rx: rx ?? this.rx,
        myAds: myAds ?? this.myAds,
      );
  @override
  List<Object?> get props => [
        myAds,
        formKey,
        selectedService,
        title,
        videoLink,
        image,
        isImageEmpty,
        rx,
      ];
}
