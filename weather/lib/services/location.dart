import 'package:geolocator/geolocator.dart';

class Location {
  Position position;

  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print("Exception " + e);
    }
  }
}
