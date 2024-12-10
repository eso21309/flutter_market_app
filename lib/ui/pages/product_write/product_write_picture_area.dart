import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductWritePictureArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: AspectRatio(
              //부모의 높이가 60이기 때문에 1:1로 하면 부모사이즈 안에서 맞춰짐
              //모서리 둥글게 하기 ClipRect로 씌워서 속성 주기 : 이미지의 모서리를 둥글게 만들 때는 보통 ClipRRect를 더 선호
              aspectRatio: 1,
              child: Image.network(
                "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              //TODO 사진 업로드 구현하기
              print("사진 업로드");
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                //컨테이너를 AspectRatio로 감싸고 속성 1 주기
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    Text(
                      "1/10",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
