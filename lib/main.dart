import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/login_and_register/controllers/login_controller.dart';
import 'package:note_sync/login_and_register/controllers/register_controller.dart';
import 'package:note_sync/login_and_register/widgets/login_page_widget.dart';
import 'package:note_sync/login_and_register/widgets/login_register_page_widget.dart';
import 'package:note_sync/login_and_register/widgets/user_register_page_widget.dart';
import 'package:note_sync/projects/controllers/projeto_controller.dart';
import 'package:note_sync/projects/widgets/projeto_page_widget.dart';
import 'package:note_sync/root_page/root_controller.dart';
import 'package:note_sync/root_page/root_widget.dart';
import 'package:note_sync/splash_screen/splash_screen_widget.dart';
import 'package:note_sync/user/controllers/avatar_controller.dart';
import 'package:note_sync/user/controllers/user_controller.dart';

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
      builder: EasyLoading.init(),
      routes: {
        '/': (context) => const SplashScreenWidget(),
        '/rootPage': (context) => const RootPageWidget(),
        '/loginPage': (context) => const LoginPageWidget(),
        '/loginRegisterPage': (context) => const LoginRegisterPageWidget(),
        '/userRegisterPage': (context) => const UserRegisterPageWidget(),
        '/projetoPage': (context) => const ProjetoPageWidget(),
      },
    );
  }
}

void setupSingletons() {
  GetIt.I.registerLazySingleton<RootController>((() => RootController()));
  GetIt.I
      .registerLazySingleton<RegisterController>((() => RegisterController()));
  GetIt.I.registerLazySingleton<LoginController>((() => LoginController()));
  GetIt.I.registerLazySingleton<ProjetoController>((() => ProjetoController()));
  GetIt.I.registerLazySingleton<UserController>((() => UserController()));
  GetIt.I.registerLazySingleton<AvatarController>((() => AvatarController()));
}
