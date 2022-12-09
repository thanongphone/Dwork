import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI({super.key});

  // const FormUI({super.key});

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  int _selectedIndex = 0;
  void _onItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//////////////////////////////////// ////////////////////////
  String? _radioValue;
////////////////////////////////////////////////////////////////
  List<String> menulist = ['Menu 1', 'Menu 2', 'Menu 3'];
  String? getText;
///////////////////////////////////////////////////////////////
  Map<String, bool> language = {'Dart': false, 'Python': false};
  //Map pen karn kep khrmoon pen luksana key and value

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetBottom1 = [
      buildUI1(),
      const Text('botthom tab 2'),
      const Text('botthom tab 3'),
    ];
    List<Widget> widgetBottom2 = [
      const Text('botthom tab 1'),
      const Text('botthom tab 2'),
      const Text('botthom tab 3'),
    ];
    List<Widget> widgetBottom3 = [
      buildUI1(),
      const Text('botthom tab 2'),
      const Text('botthom tab 3'),
    ];

    return DefaultTabController(
      length: 3, //จำนวน TopTab : Form,Info,contact
      initialIndex: 0, //เรี่มต้นจาก index 0 = หน้า 1
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: buildDrawer(),
        appBar: AppBar(
          title: const Text('User Form'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: 'Form',
            ),
            Tab(
              icon: Icon(Icons.info),
              text: 'Info',
            ),
            Tab(
              icon: Icon(Icons.contact_page),
              text: 'Contact',
            ),
          ]),
          backgroundColor: const Color.fromARGB(255, 146, 30, 230),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(child: widgetBottom1.elementAt(_selectedIndex)),

            // const Center(child: Text('Tab 2')),
            Center(child: widgetBottom2.elementAt(_selectedIndex)),
            Center(child: widgetBottom3.elementAt(_selectedIndex)),
          ],
        ),
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  //start use each widget
//////////////////////////////////////////////
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
              'MENU',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('menu 1'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('menu 2'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('menu 3'),
          onTap: () {},
        )
      ]),
    );
  }

///////////////////////////////////////////////////////
  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.business), label: 'Business'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.school), label: 'School'),
      ],
      currentIndex: _selectedIndex, // ดีงมาจากทางล่าง class
      selectedItemColor: Colors.red,
      onTap: _onItem,
    );
  }
//////////////////////////////////////////
  Widget buildTextField1() {
    // ignore: prefer_const_constructors
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );
  }

////////////////////////////////////////////////
  Widget buildRadio() {
    return Row(
      children: [
        Radio(
            value: 'Male',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
        const Text(
          'Male',
          style: TextStyle(fontSize: 16),
        ),
        Radio(
            value: 'Female',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
        const Text(
          'Female',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  Widget buildDropdown() {
    return DropdownButton(
      hint: const Text('Please select'),
      value: getText,
      onChanged: (String? newValue) {
        setState(() {
          getText = newValue;
        });
      },
      items: menulist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }

////////////////////////////////////////////////////////////////
  Widget buildCheckbox() {
    return Row(
      children: [
        Checkbox(
            value: language['Dart'],
            onChanged: (bool? value) {
              setState(() {
                language['Dart'] =
                    value!; //sai ! phc pen neo null sefety (new version)
              });
            }),
        const Text('Dart', style: TextStyle(fontSize: 16)),
        Checkbox(
            value: language['Python'],
            onChanged: (bool? value) {
              setState(() {
                language['Python'] =
                    value!; //sai ! phc pen neo null sefety (new version)
              });
            }),
        const Text('Python', style: TextStyle(fontSize: 16)),
      ],
    );
  }
  //////////////////////////////////////////////////////

  ElevatedButton buildButton() {
    return ElevatedButton(
      onPressed: () {
        _showDialog();
      },
      child: const Text('Submit'),
    );
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('This is AlertDialog'),
                  const Text('Please Kick Ok')
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  Widget buildListView() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            height: 50,
            color: Colors.purple[500],
            child: const Text('listView 1'),
          ),
          Container(
            height: 50,
            color: Colors.purple[300],
            child: const Text('listView 2'),
          ),
          Container(
            height: 50,
            color: Colors.purple[200],
            child: const Text('listView 3'),
          ),
          Container(
            height: 50,
            color: Colors.purple[500],
            child: const Text('listView 4'),
          ),
          Container(
            height: 50,
            color: Colors.purple[300],
            child: const Text('listView 5'),
          ),
          Container(
            height: 50,
            color: Colors.purple[200],
            child: const Text('listView 6'),
          ),
        ],
      ),
    );
  }

  Widget buildUI1() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildTextField1(),
            buildRadio(),
            buildDropdown(),
            buildCheckbox(),
            buildButton(),
            buildListView(),
          ],
        ),
      ),
    );
  }
}
