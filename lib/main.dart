import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/root_controller.dart';
import 'package:note_sync/root_widget.dart';
import 'package:note_sync/sub_tab1.dart';

void main() {
  setupSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Sync',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RootPageWidget(),
        '/subTab1': (context) => const SubTab1(),
      },
    );
  }
}

void setupSingletons() {
  GetIt.I.registerLazySingleton<RootPageController>((() => RootPageController()));
}