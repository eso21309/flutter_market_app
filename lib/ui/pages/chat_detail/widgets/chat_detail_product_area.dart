import 'package:flutter/material.dart';

class ChatDetailProductArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DefaultTextStyle(
        //컨테이너 안의 텍스트 스타일이 동일하면 위젯으로 가싸서 DefaultTextStyle를 주기
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black, //컬러 필수
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "아이폰 팝니다",
            ),
            SizedBox(height: 2),
            Text(
              "2024.12,10",
            ),
          ],
        ),
      ),
    );
  }
}
