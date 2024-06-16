import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'João',
      userImageUrl: 'assets/images/avtar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia. Vai ter reunião hoje',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Bia',
      userImageUrl: 'assets/images/avtar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Bom dia, Acredito que sim',
      createdAt: DateTime.now(),
      userId: '789',
      userName: 'Ana',
      userImageUrl: 'assets/images/avtar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    controller.add(_msgs);
    _controller = controller;
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
