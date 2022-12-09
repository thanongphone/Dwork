import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
            title:
                const Text('Welcome', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        // bottomNavigationBar: buildBottomNavBar(),
      ),
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
