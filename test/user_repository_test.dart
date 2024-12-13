import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 성공 케이스와 실패 케이스를 분리하면 더 명확해요
  test("로그인 실패 테스트", () async {
    final userRepo = UserRepository();
    final result = await userRepo.login(username: "1111", password: "1111");
    expect(result, false);
  });

  test("로그인 성공 테스트", () async {
    final userRepo = UserRepository();
    final result = await userRepo.login(username: "tester", password: "1111");
    expect(result, true);
  });
}
