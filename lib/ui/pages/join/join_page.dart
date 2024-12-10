import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/nickname_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/pw_text_form_field.dart';

class JoinPage extends StatefulWidget {
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  void onImageUpload() {
    print("onImageUpload");
  }

  final idController = TextEditingController();
  final pwController = TextEditingController();
  final nickController = TextEditingController();
  final formkey = GlobalKey<FormState>(); //벨리데이션을 위해 넘겨받아야 하는 폼키

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    nickController.dispose();
    super.dispose();
  }

  void onJoin() {
    formkey.currentState?.validate(); //벨리데이트 현재상태 가져오기
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); //언포커스시 키보드 사라지게 제스처로 감싸기
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          //폼으로 감싸고 키속성 가져오기
          key: formkey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: [
              Text(
                "안녕하세요\n아이디와 비밀번호를 입력해주세요",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: onImageUpload,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.grey[600],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "프로필 사진",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              IdTextFormField(controller: idController),
              SizedBox(height: 16),
              PwTextFormField(controller: pwController),
              SizedBox(height: 16),
              NicknameTextFormField(controller: nickController),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: onJoin,
                child: Text("회원가입"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
