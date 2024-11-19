import 'package:flutter/material.dart';
import 'package:message_board_app/widgets/appbar.dart';
import 'chat.dart';
import 'profile.dart';
import 'settings.dart';

class MessageBoardsScreen extends StatelessWidget {
  const MessageBoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    //hardcoded boards
    final boards = [
      {'name': 'Gaming', 'icon': Icons.games_outlined},
      {'name': 'Sports', 'icon': Icons.sports_football},
      {'name': 'Travel', 'icon': Icons.airplanemode_active},
      {'name': 'Coding', 'icon': Icons.computer},
      {'name': 'Music', 'icon': Icons.music_note},
    ];

    return Scaffold(
      key: _scaffoldKey,
       appBar: CustomAppBar(
        title: 'Message Boards',
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
      body: ListView.builder(
        itemCount: boards.length,
        itemBuilder: (ctx, index) {
          final board = boards[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(
                board['icon'] as IconData,
                color: const Color(0xFF2193b0),
              ),
              title: Text(
                board['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(boardName: board['name'] as String),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}