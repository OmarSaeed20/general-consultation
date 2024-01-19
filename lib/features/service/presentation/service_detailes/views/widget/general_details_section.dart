import 'dart:math';

import 'package:general_consultation/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeneralDetails extends StatelessWidget {
  const GeneralDetails({super.key, required this.controller});
  final ServiceDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: gPaddingSymmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                title: Kstrings.aboutHim.tr,
                padLef: 0,
                supStyle: gStyle12(
                  fontWeight: FontWeight.w400,
                  color: KColors.textGray2,
                ),
                padding: gPaddingSymmetric(vertical: 24),
                supTitle:
                    "${controller.state.value.vendor?.about.toString().replaceAll("null", "").trim()}",
              ),
              TitleRowWidget(
                padding: gPadding(),
                title: Kstrings.timesOfWork.tr,
              ),
            ],
          ),
        ),
        _AvaliableVendorDays(dayes: controller.state.value.vendor?.dayes),
        Visibility(
          visible: controller.state.value.vendor?.services != null,
          child: AuthHeader(
            title: Kstrings.experiences.tr,
            titStyle: gStyle14(fontWeight: FontWeight.w700),
            padding: gPadding(right: 16, left: 16, top: 25, bottom: 10),
            padLef: 0,
            supTitle: Visibility(
              visible: controller.state.value.vendor?.services != [],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.state.value.vendor?.services != null) ...[
                    ...controller.state.value.vendor!.services!
                        .map(
                          (e) => TextWidget(
                            "- ${e.valide().trim()} .",
                            padding: gPaddingSymmetric(vertical: 9),
                            style: gStyle12(color: const Color(0xFF130C04)),
                          ),
                        )
                        .toList(),
                  ]
                ],
              ),
            ),
          ),
        ),
        TitleRowWidget(
          padding: gPadding(right: 16, bottom: 18),
          title: Kstrings.aCopyOfLicenseToPracticeProfession.tr,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: .5, color: KColors.fillBorder),
          ),
          child: ChatImageBody(
            url: "${controller.state.value.vendor?.licenseWorkImage.valide()}",
          ),
        ),
        24.sH,
        GraidViewAdsCard(
          controller: controller.state.value.officeScrollContr,
          vendors: controller.state.value.officeConsultaions,
          isLoading: controller.state.value.rxConsultaions.isLoading,
        ),
        24.sH,
        AuthHeader(
          padLef: 0,
          title: Kstrings.workAddress.tr,
          padding: gPaddingSymmetric(horizontal: 16),
          supTitle: ListTile(
            contentPadding: gPadding(bottom: 16),
            leading: const Icon(Icons.location_on_outlined),
            title: TextWidget(
              controller.state.value.vendor?.locationText,
              style: gStyle12(color: const Color(0xFF767470)),
            ),
            trailing: ImageWidget(
              path: Kimage.boldMapIcon,
              onTap: () => Get.toNamed(
                Routes.mapView,
                arguments: {
                  "location": LatLng(
                    double.parse(controller.state.value.vendor!.locationLat!),
                    double.parse(controller.state.value.vendor!.locationLong!),
                  ),
                  "name": "${controller.state.value.vendor?.name}",
                  // "address": "${controller.state.value.vendor?.locationText}",
                },
              ),
            ),
          ),
        ),
        // const ImageWidget(path: Kimage.maps),
        Container(
          height: context.height * .27,
          width: double.infinity,
          decoration: BoxDecoration(
            color: KColors.primary.withOpacity(.1),
            border: Border.all(
              width: .3.w,
              color: KColors.fillBorder,
            ),
          ),
          child: _MapCard(
            name: controller.state.value.vendor?.name,
            vendorLat: LatLng(
              double.parse(controller.state.value.vendor!.locationLat!),
              double.parse(controller.state.value.vendor!.locationLong!),
            ),
          ),
        ),
        10.sH,
        BtnWidget(
          margin: gPaddingSymmetric(vertical: 12, horizontal: 16),
          title: Kstrings.requestConsultation.tr,
          onTap: () => Routes.chatPage(controller.state.value.vendor!),
        )
      ],
    );
  }
}

class _MapCard extends GetView<MapControllerImp> {
  const _MapCard({required this.name, this.vendorLat});
  final String? name;
  final LatLng? vendorLat;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.state.value.location == null
          ? const LoadingWidget()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: vendorLat ?? controller.state.value.location!,
                zoom: 16,
              ),
              onMapCreated: (GoogleMapController googleMapController) =>
                  controller.onMapCreated(googleMapController),
              markers: <Marker>{
                Marker(
                  markerId: MarkerId(
                      '{current_location}${Random().nextInt(999) + 1}'),
                  position: vendorLat ?? controller.state.value.location!,
                  infoWindow: InfoWindow(title: name.valide()),
                  draggable: false, // Make the marker draggable
                ),
              },
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
              circles: {
                Circle(
                  circleId: const CircleId("location_"),
                  center: vendorLat ?? controller.state.value.location!,
                  radius: 150.0,
                  strokeWidth: 1,
                  strokeColor: KColors.primary.withOpacity(0.40),
                  fillColor: KColors.primary.withOpacity(0.15),
                ),
              },
            ),
    );
  }
}

class _AvaliableVendorDays extends StatelessWidget {
  const _AvaliableVendorDays({required this.dayes});
  final Dayes? dayes;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: dayes != null,
      child: Container(
        padding: gPadding(right: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 8,
            children: [
              _DayData(day: dayes?.saturday),
              _DayData(day: dayes?.sunday),
              _DayData(day: dayes?.monday),
              _DayData(day: dayes?.thursday),
              _DayData(day: dayes?.wednesday),
              _DayData(day: dayes?.tuesday),
              _DayData(day: dayes?.friday),
            ],
          ),
        ),
      ),
    );
  }
}

class _DayData extends StatelessWidget {
  const _DayData({required this.day});
  final Day? day;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: day != null,
      child: Container(
        margin: gPadding(left: 10),
        width: 128.w,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: gPaddingSymmetric(vertical: 7),
              decoration: BoxDecoration(
                color: KColors.borderColor2,
                borderRadius: BorderRadius.only(
                  bottomLeft: 6.radiusCircular,
                  bottomRight: 6.radiusCircular,
                ),
              ),
              child: TextWidget(
                day?.name?.replaceAll("messages.", ""),
                style: gStyle14(
                  fontWeight: FontWeight.w700,
                  color: KColors.white,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: KColors.fillColor2,
                borderRadius: BorderRadius.only(
                  bottomLeft: 6.radiusCircular,
                  bottomRight: 6.radiusCircular,
                ),
              ),
              padding: gPaddingSymmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    day?.from/* .valide().replaceRange(5, null, '') */,
                    style: gStyle14(fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: gPaddingSymmetric(vertical: 8),
                    child: TextWidget(Kstrings.to.tr),
                  ),
                  TextWidget(
                    day?.to/* .valide().replaceRange(5, null, '') */,
                    style: gStyle14(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String formattedTime(String time) {
  DateTime dateTime = DateTime.parse(time);
  String formattedTime = dateTime.toString().forrmattedDateTime;
  return formattedTime;
}
