import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/home_tab/widgets/home_tab_list_view.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/home_tab/widgets/home_tap_app_bar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SizedBox.expand(
      //화면 전체를 활용하고 싶을 때
      //HomeTab이 화면의 전체 영역을 사용해야 하기 때문에 SizedBox.expand로 감싼것임
      //감싸지 않으면, 자식 위젯들의 크기만큼만 공간을 차지하게 된다.
      child: Column(
        children: [
          HomeTapAppBar(),
          HomeTabListView(),
        ],
      ),
    );
  }
}
