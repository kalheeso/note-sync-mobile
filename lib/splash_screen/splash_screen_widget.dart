import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/user/controllers/user_controller.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {

  final userController = GetIt.instance<UserController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      userController.tryAndFetchLoggedUser(
          onSuccess: () {
            Navigator.of(context).pushReplacementNamed('/rootPage');
            return;
          }, onError: () {
            Navigator.of(context).pushReplacementNamed('/loginPage');
            return;
          }
        );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue, height: MediaQuery.of(context).size.height,
      child: Image.asset('assets/images/notesyncng.png'),),
    );
  }
}