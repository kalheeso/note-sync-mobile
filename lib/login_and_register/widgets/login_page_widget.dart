// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/login_and_register/controllers/login_controller.dart';
import 'package:note_sync/user/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;

  final loginController = GetIt.instance<LoginController>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              const Text(
                "Bem-vindo",
                style: TextStyle(color: Color(0xfff6f6f7), fontSize: 40, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                "Entre na sua conta",
                style: TextStyle(color: Color(0xfff6f6f7), fontSize: 16),
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _controllerUsername,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIconColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  loginController.userLoginModel = loginController.userLoginModel.copyWith(username: text);
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIconColor: Colors.white,
                  prefixIconColor: Colors.white,
                ),
                onChanged: (text) {
                  loginController.userLoginModel = loginController.userLoginModel.copyWith(password: text);
                },
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  Observer(
                    builder: (context) {
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
                        onPressed: loginController.isLoginTryValid() ? () async {
                          try {
                            EasyLoading.show(status: 'Carregando', dismissOnTap: false, indicator: const CircularProgressIndicator());
                            await loginController.logarUsuario(username: loginController.userLoginModel.username, password: loginController.userLoginModel.password);
                            loginController.userLoginModel = UserLoginModel(username: '', password: '');
                            EasyLoading.dismiss();
                            Navigator.of(context).pushNamedAndRemoveUntil('/rootPage', (route) => false);
                          } catch (e) {
                            EasyLoading.dismiss();
                            EasyLoading.showError('Cheque seus dados e tente novamente');
                          }
                        } : null,
                        child: const Text("Login"),
                      );
                    }
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Ainda não tem uma conta?", style: TextStyle(color: Colors.white),),
                      TextButton(
                        onPressed: () {
                          SharedPreferences.getInstance().then((sp) {
                            if (sp.getInt('id_login') != null) {
                              Navigator.pushNamed(
                                context, '/userRegisterPage'
                              );
                            } else {
                              Navigator.pushNamed(
                                context, '/loginRegisterPage'
                              );
                            }
                          });

                        },
                        child: const Text("Registre-se"),
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
    _focusNodePassword.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}