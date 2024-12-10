import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';

class HomeTapAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //앱바 사용할때 스캐폴드 사용 안하면 bottom 속성을 사용 못함
    return AppBar(
      title: Text("온천동"),
      actions: [
        GestureDetector(
          onTap: () {
            SnackbarUtil.showSnackBar(context, "준비중입니다.");
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
