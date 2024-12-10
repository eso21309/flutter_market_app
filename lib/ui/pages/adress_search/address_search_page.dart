import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';

class AddressSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); //빈곳 터치하면 키보드 내려가게 하기 (제스처로 감싸주고 onTap 안에 넣기)
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            //onSubmitted : 사용자가 텍스트 입력을 완료하고
            //키보드의 완료/확인(done/return) 버튼을 눌렀을 때 실행되는 콜백 함수
            onSubmitted: (value) {
              print("onSubmitted $value");
            },
            decoration: InputDecoration(
              hintText: "동명(읍,면)으로 검색 (ex: 서초동)",
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 12),
              Container(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("현재 위치로 찾기"),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return JoinPage();
                        }));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "부산광역시 동래구 온천동",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
