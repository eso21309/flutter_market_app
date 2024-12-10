import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      //Consumer : 데이터가 업데이트 될때마다 자동으로 화면 그려줘
      builder: (context, ref, child) {
        final currentIndex = ref.watch(homeViewModel);
        //관리자한테 상태 모델 달라고 요청
        final viewModel = ref.read(homeViewModel.notifier);

        return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: viewModel.onIndexChanged,
            iconSize: 32,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined),
                activeIcon: Icon(Icons.home),
                label: "홈",
                tooltip: "이걸 왜넣어?",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2),
                activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                label: "채팅",
                tooltip: "이걸 왜넣어?",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(CupertinoIcons.person_fill),
                label: "나의 마켓",
                tooltip: "이걸 왜넣어?",
              )
            ]);
      },
    );
  }
}
