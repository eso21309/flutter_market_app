//MVVM의 구조를 맞추기 위해 뷰모델을 만든다.

// 1. 상태 클래스 만들기 => x
// 2. 뷰모델 만들기 => 일반 클래스로 만들기

import 'package:flutter_market_app/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 2. 뷰모델 만들기 => 일반 클래스로 만들기
// 상태관리할 필요 없으니까 Notifier x
class LoginViewModel {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final userRepository = UserRepository();
    return await userRepository.login(
      username: username,
      password: password,
    );
  }
}

// 3. 뷰모델 관리자 만들기
final loginViewModel = Provider.autoDispose((ref) {
  return LoginViewModel();
});
