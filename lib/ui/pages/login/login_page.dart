import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/pw_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                Text(
                  "안녕하세요~ \n아이디와 비밀번호로 로그인해주세요",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                IdTextFormField(controller: idController),
                SizedBox(height: 24),
                PwTextFormField(controller: pwController),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    formkey.currentState?.validate();
                  },
                  child: Text("로그인"),
                )
              ],
            ),
          )),
    );
  }
}
