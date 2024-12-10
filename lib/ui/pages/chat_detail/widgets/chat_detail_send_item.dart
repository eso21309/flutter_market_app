import 'package:flutter/material.dart';

class ChatDetailSendItem extends StatelessWidget {
  final String content;
  final DateTime datetime;

  ChatDetailSendItem({
    required this.content,
    required this.datetime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Text(
          datetime.toIso8601String(),
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}
