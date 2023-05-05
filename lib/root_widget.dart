import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/root_controller.dart';
import 'package:note_sync/tab1.dart';
import 'package:note_sync/tab2.dart';
import 'package:note_sync/tab3.dart';

class RootPageWidget extends StatefulWidget {
  const RootPageWidget({super.key});

  @override
  State<RootPageWidget> createState() => _RootPageWidgetState();
}

class _RootPageWidgetState extends State<RootPageWidget> {

  @override
  Widget build(BuildContext context) {
    final rootPageController = GetIt.instance<RootPageController>();

    final tabs = const [
      Tab1(),
      Tab2(),
      Tab3()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Sync'),
      ),
      body: tabs[rootPageController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.my_library_books_sharp), label: 'My Cards'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
      ],
        currentIndex: rootPageController.currentIndex,
        onTap: (index) {
          setState(() {
            rootPageController.currentIndex = index;
          });
        },),
    );
  }
}

