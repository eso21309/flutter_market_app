import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    //설정안할시 실패 응답오면 throw 던져서 에러남
    validateStatus: (status) => true,
  ));

  //1. 이름으로 검색하는 기능

  //https://api.vworld.kr/req/search
  //key=12336597-F09C-3D5C-9A79-52118BDABC7D
  // request = search
  // key
  // query = 상갈동
  // type = DISTRICT
  // category = L4
  Future<List<String>> findByName(String query) async {
    try {
      final response = await _client.get(
        //response는 DIO 라이브러리의 Response 타입변수
        //그래서 아래에 response.statusCode라는 속성을 쓸수 있음
        "https://api.vworld.kr/req/search",
        queryParameters: {
          "request": "search",
          "key": "12336597-F09C-3D5C-9A79-52118BDABC7D",
          "query": query,
          "type": "DISTRICT",
          "category": "L4",
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == "OK") {
        // Response >result > items >> title
        final items = response.data["response"]["result"]["items"];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          return "${item["title"]}";
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  //2. 위도경도로 검색하는 기능
  // Response > result> features >> properties >> full_nm
  // https://api.vworld.kr/req/data
  // request = GetFeature
  // key = 12336597-F09C-3D5C-9A79-52118BDABC7D
  // data = LT_C_ADEMD_INFO
  // geomFilter = POINT(127.1146587 37.2804055)
  // geometry = false
  // Size = 100
  Future<List<String>> findByLatLng(double lat, double lng) async {
    try {
      final response = await _client.get(
        "https://api.vworld.kr/req/data",
        queryParameters: {
          "request": "GetFeature",
          "key": "12336597-F09C-3D5C-9A79-52118BDABC7D",
          "data": "LT_C_ADEMD_INFO",
          "geomFilter": "POINT($lng $lat)",
          "geometry": "false",
          "Size": "100",
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == "OK") {
        // Response > result> features >> properties >> full_nm
        final features = response.data["response"]["result"]
            ["featureCollection"]["features"];
        final featureList = List.from(features);
        final iterable = featureList.map((feat) {
          return "${feat["properties"]["full_nm"]}";
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
