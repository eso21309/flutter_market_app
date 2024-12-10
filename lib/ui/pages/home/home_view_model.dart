// 1. 상태 클래스 만들기
// 2. 뷰모델 만들기
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<int> {
  //AutoDisposeNotifier 숫자 타입의 상태를 자동으로 정리해주는 관리자
  @override
  int build() {
    return 0; //첫 번째 탭이 선택된 상태로 시작
  }

// 사용자가 탭을 클릭하면 호출되는 함수
// newIndex는 사용자가 선택한 새로운 탭의 번호를 의미해요
// state에 새 값을 할당하면 화면이 자동으로 업데이트돼요
  void onIndexChanged(int newIndex) {
    state = newIndex;
  }
}
// 3. 뷰모델 관리자 만들기

final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, int>(() {
  return HomeViewModel();
});
