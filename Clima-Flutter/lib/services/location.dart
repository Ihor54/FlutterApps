import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      ).timeout(Duration(seconds: 10));
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print("location error");
      print(e);
    }
  }
}
