// ignore_for_file: use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/login_and_register/controllers/register_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegisterPageWidget extends StatefulWidget {
  const UserRegisterPageWidget({super.key});

  @override
  State<UserRegisterPageWidget> createState() => _UserRegisterPageWidgetState();
}

class _UserRegisterPageWidgetState extends State<UserRegisterPageWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeApelido = FocusNode();
  final FocusNode _focusNodeNome = FocusNode();

  final registerController = GetIt.instance<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
                  InkWell(onDoubleTap: () {
                    Navigator.of(context).pushNamed('/loginRegisterPage');
                  },
                    child: const Text(
                      "Insira seus dados",
                      style: TextStyle(color: Color(0xfff6f6f7), fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 35),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Nome completo",
                      prefixIcon: const Icon(Icons.person_outline),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (text) {
                      registerController.userRegister =
                          registerController.userRegister.copyWith(nome: text);
                    },
                    onEditingComplete: () => _focusNodeNome.requestFocus(),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (text) {
                      registerController.userRegister =
                          registerController.userRegister.copyWith(apelido: text);
                    },
                    focusNode: _focusNodeApelido,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Apelido",
                      prefixIcon: const Icon(Icons.email_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onEditingComplete: () => _focusNodeApelido.requestFocus(),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Observer(builder: (context) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: Color(0xff4b4b4d),
                            disabledForegroundColor: Color(0xffbabfc6),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: (registerController
                                  .isUserRegisterValid())
                              ? () async {
                                await registerController.registerUsuario(apelido: registerController.userRegister.apelido!, nome: registerController.userRegister.nome!);
                                Navigator.of(context).pushNamedAndRemoveUntil('/loginPage', (route) => false);
                                SharedPreferences.getInstance().then((sp) {
                                  // this will take you to login page instead of sub_register_page if you rerun the app
                                  sp.remove('id_login');
                                });
                                } : null,
                          child: const Text("Registrar"),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Já possui uma conta?", style: TextStyle(color: Colors.white),),
                          TextButton(
                            onPressed: () => Navigator.pushReplacementNamed(context, '/loginPage'),
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
