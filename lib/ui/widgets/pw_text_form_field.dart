import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/validator_util.dart';

class PwTextFormField extends StatelessWidget {
  TextEditingController controller;

  PwTextFormField({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: "비밀번호를 입력해 주세요"),
      obscureText: true, //비밀번호 가리는 속성
      validator: ValidatorUtil.validatorPassword,
    );
  }
}
