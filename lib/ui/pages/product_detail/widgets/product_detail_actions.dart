import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/product_write/product_write_page.dart';

class ProductDetailActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ToDo 자신의 글이 아니면 보여주지 않기!

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print("삭제버튼 클릭됨");
          },
          child: Container(
            child: Icon(Icons.delete),
            width: 50,
            height: 50,
            color: Colors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductWritePage();
                },
              ),
            );
          },
          child: Container(
            child: Icon(Icons.edit),
            width: 50,
            height: 50,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
