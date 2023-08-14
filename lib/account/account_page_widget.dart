// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/projects/widgets/modals.dart';
import 'package:note_sync/user/controllers/avatar_controller.dart';
import 'package:note_sync/user/controllers/user_controller.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({super.key});

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {

  final userController = GetIt.instance<UserController>();
  final avatarController = GetIt.instance<AvatarController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff595d63),
        title: const Text('Minha Conta'),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Observer(
          builder: (context) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Center(
                child: SizedBox(
                  height: 160,
                  child: Image.asset(avatarController.avatarPath ?? 'assets/images/avatar.png'),
                ),
              ),
              TextButton(
                onPressed: () {
                  showAvatarSelectionModal(context);
                },
                child: const Text("Editar avatar", style: TextStyle(fontSize: 16),),
              ),
              SizedBox(height: 32,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Nome", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                Text(userController.sessionUser?.nome ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
              ],),
              Divider(height: 32, indent: 48, color: Colors.white.withOpacity(0.6),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                Text(userController.sessionUser?.username ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
              ],),
              Divider(height: 32, indent: 48, color: Colors.white.withOpacity(0.6),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                Text(userController.sessionUser?.email ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
              ],),
              Divider(height: 32, indent: 48, color: Colors.white.withOpacity(0.6),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Apelido", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                Text(userController.sessionUser?.apelido ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
              ],),
              Divider(height: 32, indent: 48, color: Colors.white.withOpacity(0.6),),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed:() async {
                  await userController.encerrarSessao();
                  Navigator.of(context).pushNamedAndRemoveUntil('/loginPage', (route) => false);
                },
                child: const Text("Encerrar sessão"),
              )
            ]);
          }
        ),
      ),
    );
  }
}