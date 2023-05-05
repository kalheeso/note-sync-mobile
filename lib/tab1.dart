import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/subTab1');
        },
        child: Container(color: Colors.brown, height: 200, width: 200,)),
    );
  }
}