part of 'map_controller.dart';

class MapState extends Equatable {
  final String title;
  final LatLng? location;
  final String address;
  final RequestState rx;
  final Completer<GoogleMapController> controller;
  const MapState({
    required this.controller,
    this.title = "",
    this.address = "",
    this.rx = RequestState.none,
    this.location,
  });

  MapState copyWith({
    String? title,
    String? address,
    RequestState? rx,
    LatLng? location,
    Completer<GoogleMapController>? controller,
  }) =>
      MapState(
        controller: controller ?? this.controller,
        title: title ?? this.title,
        address: address ?? this.address,
        location: location ?? this.location,
        rx: rx ?? this.rx,
      );

  @override
  List<Object?> get props => [controller, title, address, location, rx];
}
