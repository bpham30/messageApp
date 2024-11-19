import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_board_app/boards.dart';
import 'package:message_board_app/profile.dart';
import 'package:message_board_app/settings.dart';
import 'package:message_board_app/widgets/appbar.dart';

class ChatScreen extends StatefulWidget {
  final String boardName;

  const ChatScreen({super.key, required this.boardName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //controller for message input
  final _messageController = TextEditingController();
  //init firestore and auth
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  //send message function
  Future<void> _sendMessage() async {
    //get current user
    final user = _auth.currentUser;
    if (user != null && _messageController.text.trim().isNotEmpty) {
      final messageText = _messageController.text.trim();

      //get userdata
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final firstName = userDoc.data()?['firstName'] ?? 'Anonymous';
      final lastName = userDoc.data()?['lastName'] ?? '';

      //save message to board
      await _firestore
          .collection('boards')
          .doc(widget.boardName)
          .collection('messages')
          .add({
        'text': messageText,
        'firstName': firstName,
        'lastName': lastName,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: widget.boardName,
        scaffoldKey: _scaffoldKey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2193b0)),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Message Boards'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MessageBoardsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('boards')
                  .doc(widget.boardName)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No messages yet. Be the first to say something!',
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (ctx, index) {
                    final message = messages[index];
                    final messageText = message['text'] ?? '';
                    final firstName = message['firstName'] ?? 'Anonymous';
                    final lastName = message['lastName'] ?? '';
                    final timestamp = (message['timestamp'] as Timestamp?)
                        ?.toDate()
                        .toLocal()
                        .toString()
                        .substring(0, 16); // Format: YYYY-MM-DD HH:mm

                    return ListTile(
                      title: Text(
                        '$firstName $lastName',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(messageText),
                      trailing: timestamp != null
                          ? Text(
                              timestamp,
                              style: const TextStyle(fontSize: 12),
                            )
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2193b0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
