import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.belongsToCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser
                ? Colors.grey.shade300
                : Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: belongsToCurrentUser
                    ? Radius.circular(12)
                    : Radius.circular(0),
                bottomRight: belongsToCurrentUser
                    ? Radius.circular(0)
                    : Radius.circular(12)),
          ),
          width: 180,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Column(
            children: [
              Text(
                message.userName,
                style: TextStyle(
                  color: belongsToCurrentUser
                      ? Colors.black
                      : Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(message.text),
            ],
          ),
        ),
      ],
    );
  }
}
