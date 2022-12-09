
import 'package:comet_app/main.dart';
import 'package:comet_app/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:comet_app/pages/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController userContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 100, 0, 162),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Color.fromARGB(255, 81, 5, 113),
            Color.fromARGB(255, 162, 33, 182),
            Color.fromARGB(255, 175, 50, 171),
          ])),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "ເຂົ້າສູ່ລະບົບ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ ບໍລິສັດ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  // width: double.infinity,
                 
                  height: 500,
                  // padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                      Color.fromARGB(255, 192, 116, 216),
                      Color.fromARGB(255, 204, 139, 231),
                      Color.fromARGB(255, 217, 163, 213),
                      Color.fromARGB(255, 222, 205, 221),
                    ]),
                    // boxShadow: 45[BoxShadow(color: Colors.green, spreadRadius: 3)],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  // ignore: sort_child_properties_last
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildImage(),
                        const SizedBox(height: 10),
                        buildText(),
                        const SizedBox(height: 10),
                        buildTextUser(),
                        const SizedBox(height: 10),
                        buildTextPassword(),
                        const SizedBox(height: 10),
                        buildButton(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      "assets/google.png",
      width: 100,
    );
  }

  Widget buildText() {
    return const Text(
      'Log in',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildTextUser() {
    return TextField(
      controller: userContoller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'User ID',
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildTextPassword() {
    return TextField(
      controller: passwordContoller,
      obscureText: true, // karn h hai mun . . .  vela sai passwordContoller
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }

  ElevatedButton buildButton() {
    return ElevatedButton(
      onPressed: () {
        if (passwordContoller.text.isEmpty || userContoller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              // ignore: prefer_const_constructors
              content: Text(
                '*Please enter your User ID or Password',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
          );
        }
      },
      child: const Text('Submit'),
    );
  }
}


