import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class MyProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserProfileImage(
          demension: 50,
          imgUrl: "https://picsum.photos/200/300",
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            "오상구",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            SnackbarUtil.showSnackBar(context, "준비중입니다");
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[500],
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "프로필 수정",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
