
import '/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/map_controller.dart';

class MapView extends GetView<MapControllerImp> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: controller.state.value.location == null
            ? const LoadingWidget()
            : Stack(
                children: [
                  _MapBody(controller: controller),
                  Positioned(
                    bottom: 20.h,
                    right: 10.h,
                    left: 10.h,
                    child: _CardDetermaineLocationBody(controller: controller),
                  ),
                ],
              ),
      ),
    );
  }
}

class _MapBody extends StatelessWidget {
  const _MapBody({required this.controller});

  final MapControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.state.value.location!,
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController googleMapController) =>
                controller.state.value.controller.complete(googleMapController),
            // controller.onMapCreated(googleMapController),
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('location_&_name'),
                position: controller.state.value.location!,
                infoWindow: InfoWindow(title: Get.arguments["name"]),
                draggable: false, // Make the marker draggable
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true, zoomControlsEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
            circles: {
              Circle(
                circleId: const CircleId("location_"),
                center: controller.state.value.location!,
                radius: 300.0,
                strokeWidth: 1,
                strokeColor: KColors.primary.withOpacity(0.40),
                fillColor: KColors.primary.withOpacity(0.15),
              ),
            },
          ),
        ),
        /*  Container(
          padding: gPadding(top: 16, right: 16, left: 16, bottom: 41),
          decoration: const BoxDecoration(color: KColors.white),
          child: Column(
            children: [
              ListTile(
                contentPadding: gPadding(right: 4),
                leading: CircleAvatar(
                  radius: 24.h,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: KColors.primary,
                  ),
                ),
                title: TextWidget(
                  Get.arguments["name"] ?? Kstrings.location.tr,
                  style: gStyle16(fontWeight: FontWeight.w600),
                ),
                subtitle: TextWidget(
                  controller.state.value.address,
                  style: gStyle14(color: const Color(0xFF6A6A6A)),
                  padding: gPadding(top: 6),
                ),
              ),
            ],
          ),
        ) */
      ],
    );
  }
}

class _CardDetermaineLocationBody extends StatelessWidget {
  const _CardDetermaineLocationBody({required this.controller});

  final MapControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: gPaddingAll(10),
      decoration: BoxDecoration(
        borderRadius: 10.radius,
        color: KColors.white,
      ),
      child: Column(
        children: [
          TextWidget(
            Get.arguments["name"] ?? Kstrings.location.tr,
            style: gStyle18(fontWeight: FontWeight.w600),
          ),
          25.sH,
          Row(
            children: [
              ImageWidget(
                path: Kimage.locationIcon,
                height: 25.h,
                width: 25.h,
              ),
              Expanded(
                child: TextWidget(
                  controller.state.value.address,
                  style: gStyle14(color: const Color(0xFF6A6A6A)),
                ),
              ),
            ],
          ),
          30.sH,
          BtnWidget(
            title: Kstrings.ok.tr,
            onTap: () async {
              await Utils.openMap(
                lat: controller.state.value.location!.latitude,
                lng: controller.state.value.location!.longitude,
              );
              /* // controller.onWillPopScope();
              Get.back(
                result: {
                  "address": controller.state.value.address,
                  "lat": controller.state.value.latLng?.latitude.toString(),
                  "lng": controller.state.value.latLng?.longitude.toString(),
                },
              ); */
            },
          )
        ],
      ),
    );
  }
}
