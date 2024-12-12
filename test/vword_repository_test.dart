import 'package:flutter_market_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 변수명 수정
  final vworldRepository = VworldRepository();

  test("VworldRepository : findByName test", () async {
    final result = await vworldRepository.findByName("온천동");
    expect(result.isEmpty, false);

    final result2 = await vworldRepository.findByName("asd");
    expect(result2.isEmpty, true);
  });

  test("VworldRepository : findByLatLng test", () async {
    final result = await vworldRepository.findByLatLng(127.1146587, 37.2804055);
    print(result);
    expect(result.isEmpty, false);

    final result2 =
        await vworldRepository.findByLatLng(127.1146587, 32.2804055);
    // 수정된 부분: List의 isEmpty 체크
    expect(result2.isEmpty, true);
  });
}
