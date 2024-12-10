import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_receive_item.dart';
import 'package:flutter_market_app/ui/pages/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailListView extends StatelessWidget {
  final children = [
    ChatDetailReceiveItem(
      imgUrl: "https://picsum.photos/200/300",
      showProfile: true,
      contnet: "안녕하세요",
      dateTime: DateTime.now(),
    ),
    SizedBox(height: 8),
    ChatDetailReceiveItem(
      imgUrl: "https://picsum.photos/200/300",
      showProfile: false,
      contnet: "네고가 가능한가요?",
      dateTime: DateTime.now(),
    ),
    SizedBox(height: 8),
    ChatDetailSendItem(
      content: "네 안녕하세요",
      datetime: DateTime.now(),
    ),
    ChatDetailSendItem(
      content: "네고 안돼요!",
      datetime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        //ListView.separated 쓰는 방법 어려움
        itemCount: children.length,
        separatorBuilder: (context, index) => SizedBox(height: 4),
        itemBuilder: (context, index) {
          return children[index];
        },
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
