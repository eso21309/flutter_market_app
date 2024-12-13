import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/snackbar_util.dart';
import 'package:flutter_market_app/ui/pages/home/home_page.dart';
import 'package:flutter_market_app/ui/pages/login/login_view_model.dart';
import 'package:flutter_market_app/ui/widgets/id_text_form_field.dart';
import 'package:flutter_market_app/ui/widgets/pw_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                Consumer(builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      //벨리데이션 성공시, 로그인 요청
                      if (formkey.currentState?.validate() ?? false) {
                        final viewModel = ref.read(loginViewModel);
                        final loginResult = await viewModel.login(
                            username: idController.text,
                            password: pwController.text);
                        if (loginResult) {
                          //로그인 성공 => HomePage로 이동(모든 페이지 제거뒤 이동)
                          //쌓인 스택을 다 제거하고 홈으로 돌아가는 속성 = pushAndRemoveUntil
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                            //기존 네비게이터 스택에 남아있는 페이지들이 하나씩
                            //route라는 인지로 넘어와서 함수가 실행됨
                            //스택에 남긴 페이지를 남길지 제거할지 정하기
                            (route) {
                              print(route);
                              return false;
                            },
                          );
                        } else {
                          //로그인 실패시 => 스낵바
                          SnackbarUtil.showSnackBar(
                              context, "아이디와 비밀번호를 확인해주세요");
                        }
                      }

                      ;
                    },
                    child: Text("로그인"),
                  );
                })
              ],
            ),
          )),
    );
  }
}
