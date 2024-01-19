import '/index.dart'; 
class ServiceDetailsState extends Equatable {
  final String address;
  final VendorEntity? vendor;
  final RequestState rxConsultaions, rxCommints;

  final List<VendorEntity> officeConsultaions;
  final MetaDataModel? officeMeta;
  final int officeCurrentPage;
  final ScrollController officeScrollContr;

  // ? commints
  final List<CommintData> commints;
  final MetaDataModel? commintMeta;
  final int commintCurrentPage;
  final ScrollController commintScrollContr;
  //? rate
  final int? rateVal;
  final TextEditingController rateMesaage;

  const ServiceDetailsState({
    required this.vendor,
    required this.rateMesaage,
    required this.commintScrollContr,
    required this.officeScrollContr,
    this.rateVal,
    this.officeCurrentPage = 1,
    this.officeMeta,
    this.officeConsultaions = const [],
    this.commintCurrentPage = 1,
    this.commintMeta,
    this.address = "",
    this.rxConsultaions = RequestState.none,
    this.rxCommints = RequestState.loading,
    this.commints = const [],
  });

  ServiceDetailsState copyWith({
    VendorEntity? vendor,
    String? address,
    RequestState? rxConsultaions,
    List<VendorEntity>? officeConsultaions,
    MetaDataModel? officeMeta,
    int? officeCurrentPage,
    ScrollController? officeScrollContr,

    RequestState? rxCommints,
    List<CommintData>? commints,
    MetaDataModel? commintMeta,
    int? commintCurrentPage,
    ScrollController? commintScrollContr,
    int? rateVal,
    String? rateMesaage, 
  }) =>
      ServiceDetailsState(
        rateMesaage: this.rateMesaage.copyWith(text: rateMesaage),
        commintCurrentPage: commintCurrentPage ?? this.commintCurrentPage,
        commintScrollContr: commintScrollContr ?? this.commintScrollContr,
        commints: commints ?? this.commints,
        commintMeta: commintMeta ?? this.commintMeta,
        rxCommints: rxCommints ?? this.rxCommints,
        vendor: vendor ?? this.vendor,
        rateVal: rateVal ?? this.rateVal,
        address: address ?? this.address,
        rxConsultaions: rxConsultaions ?? this.rxConsultaions,
        officeConsultaions: officeConsultaions ?? this.officeConsultaions,
        officeMeta: officeMeta ?? this.officeMeta,
        officeScrollContr: officeScrollContr ?? this.officeScrollContr,
        officeCurrentPage: officeCurrentPage ?? this.officeCurrentPage,
      );

  @override
  List<Object?> get props => [
        officeConsultaions,
        officeCurrentPage,
        officeMeta,
        officeScrollContr,
        vendor,
        commintCurrentPage,
        rateMesaage,
        address,
        rateVal,
        rxConsultaions,
        commintScrollContr,
        rxCommints,
        commints,
        commintMeta,
      ];
}
