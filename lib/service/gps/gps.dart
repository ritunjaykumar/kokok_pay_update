import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kokok_pay/screens/widgets/dialog/dialog_impl.dart';
import 'package:kokok_pay/utils/extensions/string_extension.dart';

import '/application/application.dart';
import '/exceptions/exceptions.dart';

class CurrentLocationInfo {
  Position position;
  String country;
  String state;
  String district;
  String address;

  CurrentLocationInfo({
    required this.position,
    required this.country,
    required this.state,
    required this.district,
    required this.address,
  });
}

class CurrentLocationFactory {
  const CurrentLocationFactory._();

  static const CurrentLocationFactory _currentLocation = CurrentLocationFactory._();

  factory CurrentLocationFactory() {
    return _currentLocation;
  }

  Future<Position> getCurrentLocation() async {
    try {
      var locationStatus = await _checkLocationPermission();
      if (locationStatus) {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        logger.i('position: $position');
        return position;
      }
      logger.i('unable to find the current location');
      throw GpsException('unable to find the current location');
    } catch (unknownExc) {
      if (unknownExc is PermissionException) {
        rethrow;
      }
      throw UnknownException('Error while getting current location');
    }
  }

  Future<CurrentLocationInfo> getCurrentLocationDetails(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      var currentLocation = await getCurrentLocation();
      List<Placemark> placeMarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks[1];
        logger.i('placeMark: $placeMark');
        return CurrentLocationInfo(
          position: currentLocation,
          country: placeMark.country.notNull(),
          state: placeMark.administrativeArea.notNull(),
          district: placeMark.locality.notNull(),
          address: '${placeMark.street}, ${placeMark.postalCode}',
        );
      }
      throw GpsException('something went wrong try again');
    } catch (gpsException) {
      if (gpsException is GpsException || gpsException is UnknownException || gpsException is PermissionException) {
        rethrow;
      }
      throw UnknownException('Error while getting current address');
    } finally {
      progressDialog.dismiss();
    }
  }

  Future<bool> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.unableToDetermine) {
      //if location permission is not there, ask for
      LocationPermission permission = await Geolocator.requestPermission();
      bool selection = permission == LocationPermission.always || permission == LocationPermission.whileInUse;
      if (selection) return true;
      throw PermissionException('Permission is denied by user');
    } else if (permission == LocationPermission.deniedForever) {
      throw PermissionException('Permission is denied forever by user!, Now enable from settings', openSettings: true);
    }
    return true;
  }

  Future<void> openLocationSetting() async {
    var openLocationSettings = await Geolocator.openLocationSettings();
    if (openLocationSettings == false) {
      throw GpsException('something went wrong, unable to open setting! try again!');
    }
  }
}
