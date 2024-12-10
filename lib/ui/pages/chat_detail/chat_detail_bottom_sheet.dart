import 'package:flutter/material.dart';

class ChatDetailBottomSheet extends StatefulWidget {
  final double bottomPadding;

  ChatDetailBottomSheet(this.bottomPadding);

  @override
  State<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends State<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSend() {
    print("onSend 터치됨");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + widget.bottomPadding,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (v) => onSend(), //v는 뭐지?
                ),
              ),
              GestureDetector(
                onTap: onSend,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
            ],
          )),
          SizedBox(
            height: widget.bottomPadding,
          )
        ],
      ),
    );
  }
}
