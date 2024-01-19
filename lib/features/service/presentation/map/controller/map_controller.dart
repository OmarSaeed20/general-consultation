import 'package:general_consultation/index.dart';

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

part 'map_state.dart';

abstract class MapController extends GetxController {
  // void getCurrentLocation();
  void onTapMap();
  void getLocation();
  Future<void> requestPermission();
  // void updateAddress();
  void getVendorAddress();
  // Future<String> getAddress(double latitude, double longitude);
  onMapCreated(GoogleMapController googleMapController);
}

class MapControllerImp extends MapController {
  MapControllerImp();
  static MapControllerImp get to => Get.find<MapControllerImp>();

  final Rx<MapState> state = MapState(
    controller: Completer<GoogleMapController>(),
    // controllerGoogleMap: GoogleMapController(),
  ).obs;

  late Rx<GoogleMapController> controllerGoogleMap;

  /*  @override
  void getCurrentLocation() async {
    // state.value.copyWith(rx: RequestState.loading);

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    state(
      state.value.copyWith(
        currentLocation: LatLng(position.latitude, position.longitude),
      ),
    );
    if (controller.value.isCompleted) {
      controllerGoogleMap.value.animateCamera(
        CameraUpdate.newLatLng(state.value.currentLocation!),
      );
    }
    updateAddress();
  } */
  @override
  void getLocation() async {
    state(state.value.copyWith(rx: RequestState.loading));

    if (state.value.controller.isCompleted) {
      state(state.value.copyWith(rx: RequestState.success));
      controllerGoogleMap.value.animateCamera(
        CameraUpdate.newLatLng(state.value.location!),
      );
    }
    getVendorAddress();
  }

  @override
  onTapMap() {
    controllerGoogleMap.value.animateCamera(
      CameraUpdate.newLatLng(state.value.location!),
    );

    getVendorAddress();
  }

  // Request location permission
  @override
  Future<void> requestPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      getLocation();
    } else {
      getVendorAddress();
    }
  }

  /*  @override
  updateAddress() async => state(
        state.value.copyWith(
          address: await getAddress(
            state.value.currentLocation!.latitude,
            state.value.currentLocation!.longitude,
          ),
        ),
      ); */
  @override
  getVendorAddress() async => state(
        state.value.copyWith(
            /* address: await getAddress(
            state.value.location!.latitude,
            state.value.location!.longitude,
          ), */
            ),
      );

/*   @override
  Future<String> getAddress(double latitude, double longitude) async {
    state(state.value.copyWith(rx: RequestState.loadMore));
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
        localeIdentifier: Get.find<AppPreferences>().getLang,
      );

      // if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[0];
      state(state.value.copyWith(rx: RequestState.success));
      return '${placemark.administrativeArea!} - ${placemark.street!}'; // You can choose from other properties like street, locality, etc.
      // } else {}
    } catch (e) {
      state(state.value.copyWith(rx: RequestState.error));
      ToastManager.showError('No Address Found');
      return 'No Address Found';
      // state.value.copyWith(rx: handelRxError(e));
      // return 'Error: $e';
    }
  }
 */
  // ignore: unused_element
  Future<void> _onMovedCamera(LatLng? latLng) async {
    final GoogleMapController n = await state.value.controller.future;
    if (latLng != null) {
      await n.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16.0),
        ),
      );
    }
  }

  @override
  onMapCreated(GoogleMapController googleMapController) async {
    controllerGoogleMap.value = googleMapController;
    // controller.value.complete(googleMapController);
    controllerGoogleMap.value = await state.value.controller.future;

    if (state.value.controller.isCompleted) {
      state(state.value.copyWith(rx: RequestState.success));
      controllerGoogleMap.value.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: state.value.location!, zoom: 16.0),
        ),
      );
    }
  }

  @override
  void onInit() async {
    LatLng location = Get.arguments["location"];
    String address = Get.arguments["address"].toString().valide();
    //debugPrint("location   is >>>>>>>>> $location");
    //debugPrint("address   is >>>>>>>>> $address");
    state(state.value.copyWith(location: location, address: address));
    await requestPermission();

    super.onInit();
  }
}
