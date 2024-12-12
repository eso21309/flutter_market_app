import 'package:flutter/material.dart';
import 'package:flutter_market_app/core/geolocator_helper.dart';
import 'package:flutter_market_app/ui/pages/adress_search/address_search_veiw_model.dart';
import 'package:flutter_market_app/ui/pages/join/join_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          title: Consumer(builder: (context, ref, child) {
            return TextField(
              //onSubmitted : 사용자가 텍스트 입력을 완료하고
              //키보드의 완료/확인(done/return) 버튼을 눌렀을 때 실행되는 콜백 함수
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  final viewmodel = ref.read(addressSearchVeiwModel.notifier);
                  viewmodel.searchByName(value);
                }
              },
              decoration: InputDecoration(
                hintText: "동명(읍,면)으로 검색 (ex: 서초동)",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 12),
              Consumer(builder: (context, ref, child) {
                return Container(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      //1. GeolocatorHelper에서 위치 받아오기
                      final position = await GeolocatorHelper.getPosition();
                      if (position != null) {
                        //2. 뷰모델에 요청하기
                        final viewModel =
                            ref.read(addressSearchVeiwModel.notifier);
                        viewModel.searchByLocation(
                            position.latitude, position.longitude);
                      }
                    },
                    child: Text("현재 위치로 찾기"),
                  ),
                );
              }),
              Consumer(
                builder: (context, ref, child) {
                  final addresses = ref.watch(addressSearchVeiwModel);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        final item = addresses[index];
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
                              item,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
