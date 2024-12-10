import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/adress_search/address_search_page.dart';
import 'package:flutter_market_app/ui/pages/login/login_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      //안전영역 씌우기
      child: SizedBox.expand(
        //SizedBox.expand를 컬럼에 씌우면 부모 사이즈에 맞춰짐
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                "assets/welcome.png",
                height: 250,
              ),
              Text(
                "당신 근처의 마켓",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "동네라서 가능한 모든것 \n 지금 내동네를 선택하고 이용해보세요!", //\n 문자열 바꾸기
                textAlign: TextAlign.center, //텍스트 정렬은 textAlign 속성 사용
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddressSearchPage();
                    },
                  ));
                },
                child: Text("시작하기"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ));
                },
                child: Container(
                  height: 56,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    "이미 계정이 있으시다면 로그인해주세요",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
