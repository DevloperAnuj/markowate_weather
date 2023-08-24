import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'getting_device_location_state.dart';

class GettingDeviceLocationCubit extends Cubit<GettingDeviceLocationState> {
  GettingDeviceLocationCubit() : super(GettingDeviceLocationInitial());

  late final Location _location = Location();
  late LocationData _locationData;
  late Timer _myTimer;

  getLocationPermission() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      bool serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  grantPermission() async {
    var permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void getDeviceLocation() async {
    print("Get Device Location Fetched");
    emit(GettingDeviceLocationLoading());
    try {
      print("Get Device Location Function Called");
      _locationData = await _location.getLocation();
      if (_locationData.latitude != null) {
        emit(GettingDeviceLocationFetched(
            lat: _locationData.latitude!, lon: _locationData.longitude!));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
