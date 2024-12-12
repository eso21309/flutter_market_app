import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    final permission = await Geolocator.checkPermission();
    //사용자의 위치 권한이 현재 어떤 상태인지
    //1. 권한이 없으면 권한 요청하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {}
    //2. 권한 요청 후 결과가 거부일 때 리턴하기
    final permission2 = await Geolocator.requestPermission();
    if (permission2 == LocationPermission.denied ||
        permission2 == LocationPermission.deniedForever) {
      return null;
    }
    //3. 모든 권한이 확인되면 실제 위치 정보를 Geolocator로 가져와서 리턴
    final position = Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    return position;
  }
}
