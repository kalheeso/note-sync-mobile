// ignore_for_file: use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/login_and_register/controllers/register_controller.dart';

class LoginRegisterPageWidget extends StatefulWidget {
  const LoginRegisterPageWidget({super.key});

  @override
  State<LoginRegisterPageWidget> createState() => _LoginRegisterPageWidgetState();
}

class _LoginRegisterPageWidgetState extends State<LoginRegisterPageWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();
  bool _obscurePassword = true;

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
                    Navigator.of(context).pushNamed('/userRegisterPage');
                  },
                    child: const Text(
                      "Registre-se",
                      style: TextStyle(color: Color(0xfff6f6f7), fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Crie sua conta",
                    style: TextStyle(color: Color(0xfff6f6f7), fontSize: 16),
                  ),
                  const SizedBox(height: 35),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.person_outline),
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(
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
                      registerController.userRegister =
                          registerController.userRegister.copyWith(username: text);
                    },
                    onEditingComplete: () => _focusNodeEmail.requestFocus(),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (text) {
                      registerController.userRegister =
                          registerController.userRegister.copyWith(email: text);
                    },
                    focusNode: _focusNodeEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "E-mail",
                      prefixIcon: const Icon(Icons.email_outlined),
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
                    onEditingComplete: () => _focusNodePassword.requestFocus(),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _obscurePassword,
                    focusNode: _focusNodePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIconColor: Colors.white,
                      prefixIconColor: Colors.white,
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
                    ),
                    onChanged: (text) {
                      registerController.userRegister =
                          registerController.userRegister.copyWith(senha: text);
                    },
                    onEditingComplete: () =>
                        _focusNodeConfirmPassword.requestFocus(),
                  ),
                  const SizedBox(height: 24),
                  Observer(
                    builder: (context) {
                      bool senhasSaoDiferentes = registerController.userRegister.senha != registerController.userRegister.senhaRepeticao;
                      return TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: _obscurePassword,
                        focusNode: _focusNodeConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Confirme sua senha",
                          labelStyle: TextStyle(color: senhasSaoDiferentes ? Colors.red : Colors.white),
                          iconColor: senhasSaoDiferentes ?
                              Colors.red : Colors.white,
                          prefixIconColor: senhasSaoDiferentes ? Colors.red : Colors.white,
                          suffixIconColor: senhasSaoDiferentes ? Colors.red : Colors.white,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white,)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: senhasSaoDiferentes ? Colors.red : Colors.white,)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: senhasSaoDiferentes ? Colors.red : Colors.white,)
                          ),
                        ),
                        onChanged: (text) {
                          registerController.userRegister = registerController
                              .userRegister
                              .copyWith(senhaRepeticao: text);
                        },
                      );
                    }
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
                                  .isLoginRegisterValid())
                              ? () async {
                                try {
                                  EasyLoading.show(status: 'Carregando', dismissOnTap: false, indicator: const CircularProgressIndicator());
                                  await registerController.registerLogin(
                                      username:
                                          registerController.userRegister.username,
                                      senha: registerController.userRegister.senha,
                                      email: registerController.userRegister.email);
                                  EasyLoading.dismiss();
                                  EasyLoading.showSuccess('Usuário criado');
                                  Navigator.of(context).pushReplacementNamed('/userRegisterPage');
                                } catch (e) {
                                  EasyLoading.dismiss();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      width: 200,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.secondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      content:
                                          const Text("Erro ao registrar usuario"),
                                    ),
                                  );
                                } 

                                } : null,
                          child: const Text("Registrar"),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Já possui uma conta?", style: TextStyle(color: Colors.white),),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
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
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
