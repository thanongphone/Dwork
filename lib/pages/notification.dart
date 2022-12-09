import 'package:flutter/material.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NotificationPage')),
      backgroundColor: Colors.white,
      drawer: buildDrawer(),
    );
  }
  Widget buildDrawer() {
    return Drawer(
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.blue,
          // ignore: prefer_const_constructors
          child: Center(
            // ignore: prefer_const_literals_to_create_immutables
            child: const Text(
              'My Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/YEARBOOK_02300.jpg'),
          radius: 100,
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('Dr. Khounthavy Silisack'),
          leading: const Icon(Icons.man_rounded),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info_rounded),
          title: const Text('About App'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        SizedBox(height: 100),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Log out'),
          onTap: () {},
        )
      ]),
    );
  }
}