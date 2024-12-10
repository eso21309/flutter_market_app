import 'package:flutter/material.dart';
import 'package:flutter_market_app/ui/widgets/user_profile_image.dart';

class ChatDetailReceiveItem extends StatelessWidget {
  final String imgUrl;
  final bool showProfile;
  final String contnet;
  final DateTime dateTime;

  ChatDetailReceiveItem({
    required this.imgUrl,
    required this.showProfile,
    required this.contnet,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showProfile
            ? UserProfileImage(
                demension: 50,
                imgUrl: "https://picsum.photos/200/300",
              )
            : SizedBox(width: 50),
        SizedBox(width: 8),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "content",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              dateTime.toIso8601String(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
