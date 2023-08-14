import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/account/account_page_widget.dart';
import 'package:note_sync/cards/cards_page_widget.dart';
import 'package:note_sync/projects/controllers/projeto_controller.dart';
import 'package:note_sync/projects/widgets/projects_tab_widget.dart';
import 'package:note_sync/root_page/root_controller.dart';
import 'package:note_sync/user/controllers/avatar_controller.dart';
import 'package:note_sync/user/controllers/user_controller.dart';

class RootPageWidget extends StatefulWidget {
  const RootPageWidget({super.key});

  @override
  State<RootPageWidget> createState() => _RootPageWidgetState();
}

class _RootPageWidgetState extends State<RootPageWidget> {

  final rootController = GetIt.instance<RootController>();
  final projetosController = GetIt.instance<ProjetoController>();
  final avatarController = GetIt.instance<AvatarController>();
  final userController = GetIt.instance<UserController>();


  @override
  void initState() {
    projetosController.getProjetosCriados();
    userController.getUserData();
    avatarController.loadAvatarSaved();
    super.initState();
  }
    var tabs = [
      ProjectsTabWidget(),
      const CardsPageWidget(),
      const AccountPageWidget(),
    ];

  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: tabs[rootController.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Projects'),
              BottomNavigationBarItem(icon: Icon(Icons.my_library_books_sharp), label: 'My Cards'),
              BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Account'),
          ],
          selectedItemColor: Color(0xff529ef4),
          unselectedItemColor: Color(0xffa3aec1),
          backgroundColor: Color(0xff595d63),
          currentIndex: rootController.currentIndex,
            onTap: (index) {
                rootController.currentIndex = index;
            },),
        );
      }
    );
  }
}

