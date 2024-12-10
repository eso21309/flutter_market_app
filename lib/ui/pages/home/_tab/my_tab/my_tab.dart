import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';
import 'package:flutter_market_app/ui/pages/home/_tab/my_tab/widgets/my_profile_box.dart';

class MyTab extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          MyProfileBox(),
          SizedBox(height: 16),
          label("나의거래"),
          Item(text: "관심목록", icon: CupertinoIcons.heart),
          Item(text: "판매내역", icon: CupertinoIcons.square_list),
          Item(text: "구매내역", icon: CupertinoIcons.bag),
          Item(text: "중고거래 가계부", icon: CupertinoIcons.book),
          Divider(),
          label("나의소식"),
          Item(text: "이벤트", icon: CupertinoIcons.gift),
          Item(text: "공지사항", icon: CupertinoIcons.news),
          Divider(),
          label("기타"),
          Item(text: "내 동네 설정", icon: Icons.location_on_outlined),
          Item(text: "동네 인증하기", icon: Icons.gps_not_fixed),
          Divider(),
          Item(text: "자주 묻는 질문"),
          Item(text: "약관 및 정책"),
        ],
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget Item({
    required String text,
    IconData? icon,
  }) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          SnackbarUtil.showSnackBar(context, "준비중입니다");
        },
        child: Container(
          height: 40,
          color: Colors.transparent,
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon),
                SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    });
  }
}
