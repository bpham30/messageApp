import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  //board name as title
  final String boardName;

  const ChatScreen({super.key, required this.boardName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          boardName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2193b0),
      ),
      body: const Center(
        child: Text(
          'Chat here',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}