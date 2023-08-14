import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardsPageWidget extends StatefulWidget {
  const CardsPageWidget({super.key});

  @override
  State<CardsPageWidget> createState() => _CardsPageWidgetState();
}

class _CardsPageWidgetState extends State<CardsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff595d63),
        title: const Text('Meus Cards'),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: SizedBox(child: Image.asset('assets/images/lego_manutencao.png'), height: MediaQuery.of(context).size.height * 0.5,),
        ),
        const SizedBox(height: 24,),
        const Text(
          'Estamos trabalhando para te entregar\nessa feature muito em breve',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffa5abba),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        )
      ],),
    );
  }
}