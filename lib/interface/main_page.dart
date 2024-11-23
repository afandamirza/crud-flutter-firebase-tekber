import 'package:crud/interface/add_page.dart';
import 'package:crud/interface/home_page.dart';
import 'package:crud/interface/list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), ListPage()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? AppBar(
              title: Text(
                "Catatan",
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.w700),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Container(
                    color: Colors.grey.shade400,
                    height: 1,
                  )),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: Container(child: Text("")),
            ),
      body: _children[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPage(),
          ));
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: Icon(Icons.home),
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}
