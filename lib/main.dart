import 'package:comet_app/pages/Feed.dart';
import 'package:comet_app/pages/Homepage.dart';
import 'package:comet_app/pages/notification.dart';
import 'package:flutter/material.dart';
import 'package:comet_app/Pages/Login.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: const LoginPage(title: 'Login',),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // const MainPage({super.key}

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final tabs = [
     HomePage(),
     FeedPage(),
     NotificationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
       items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.feed), label: 'Moment'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.notification_important), label: 'Notifications'),
        
      ],
       selectedItemColor: Color.fromARGB(255, 206, 221, 42),
        onTap: (index) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

