import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:note_sync/projects/controllers/projeto_controller.dart';
import 'package:note_sync/projects/models/projeto.dart';
import 'package:note_sync/shared/text_field.dart';
import 'package:note_sync/user/controllers/avatar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

showModalEdit(BuildContext context, ProjetoController projetoController,
    Projeto projeto) {
  showModalBottomSheet<void>(
    context: context,
    builder: (_) {
      return Container(
        color: Color(0xff1c1c1e),
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xff6099ff),
                      )),
                  const Text('Projeto',
                      style: TextStyle(
                          color: Color(0xffa5abba),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  Observer(builder: (context) {
                    return TextButton(
                        onPressed: projetoController.enableEditProjeto()
                            ? () async {
                              Navigator.of(context).pop();
                              EasyLoading.show(status: 'Salvando', dismissOnTap: false, indicator: const CircularProgressIndicator(
                                  color: Colors.white,
                                ));
                                await projetoController.editProjeto(
                                    idProjeto: projeto.id!,
                                    descricao:
                                        projetoController.projetoEdit.descricao,
                                    nome: projetoController.projetoEdit.nome);
                              EasyLoading.dismiss();
                              }
                            : null,
                        child: Text('Edit',
                            style: TextStyle(
                                color: projetoController.enableEditProjeto()
                                    ? const Color(0xff6099ff)
                                    : const Color(0xff464648),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis));
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                onChanged: (text) {
                  projetoController.projetoEdit =
                      projetoController.projetoEdit.copyWith(nome: text);
                },
                fillColor: Color(0xff2c2c2e),
                hintText: 'Nome',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                onChanged: (text) {
                  projetoController.projetoEdit =
                      projetoController.projetoEdit.copyWith(descricao: text);
                },
                fillColor: Color(0xff2c2c2e),
                hintText: 'Descrição',
                maxLines: 5,
              ),
            )
          ],
        )),
      );
    },
  ).whenComplete(() {
    // resets projetoEdit
    projetoController.projetoEdit = Projeto(nome: '', descricao: '');
  });
}

showProjectCreationModal(BuildContext context, ProjetoController projetoController) {
  showModalBottomSheet<void>(
    context: context,
    builder: (_) {
      return Container(
        color: Color(0xff1c1c1e),
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xff6099ff),
                      )),
                  const Text('Novo Projeto',
                      style: TextStyle(
                          color: Color(0xffa5abba),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  Observer(builder: (context) {
                    return TextButton(
                        onPressed: projetoController.enableCreateProjeto()
                            ? () async {
                              Navigator.of(context).pop();
                              await projetoController.createProjeto(nome: projetoController.projetoCreate.nome!, descricao: projetoController.projetoCreate.descricao!);
                              }
                            : null,
                        child: Text('Criar',
                            style: TextStyle(
                                color: projetoController.enableCreateProjeto()
                                    ? const Color(0xff6099ff)
                                    : const Color(0xff464648),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis));
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                onChanged: (text) {
                  projetoController.projetoCreate =
                      projetoController.projetoCreate.copyWith(nome: text);
                },
                fillColor: Color(0xff2c2c2e),
                hintText: 'Nome',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                onChanged: (text) {
                  projetoController.projetoCreate =
                      projetoController.projetoCreate.copyWith(descricao: text);
                },
                fillColor: Color(0xff2c2c2e),
                hintText: 'Descrição',
                maxLines: 5,
              ),
            )
          ],
        )),
      );
    },
  ).whenComplete(() {
    // resets projetoCreate
    projetoController.projetoCreate = Projeto(nome: '', descricao: '');
  });
}

showAvatarSelectionModal(BuildContext context) {
  final avatarController = GetIt.instance<AvatarController>();
  
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    builder: (_) {
      return Container(
        
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Color(0xff1c1c1e),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
        child: Stack(
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Selecione um avatar',
                          style: TextStyle(
                              color: Color(0xffa5abba),
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 32,),
                      Wrap(runAlignment: WrapAlignment.spaceBetween,
                        alignment: WrapAlignment.spaceBetween,
                        runSpacing: 24, spacing: 24,
                        children: [
                          InkWell(onTap: () {
                            avatarController.avatarPath = 'assets/images/vila_nova.png';
                            SharedPreferences.getInstance().then((sp) {
                              sp.setString('avatar_path', 'assets/images/vila_nova.png');
                            });
                            Navigator.of(context).pop();
                          },
                            child: SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Image.asset('assets/images/vila_nova.png'))),
                          InkWell(onTap: () {
                            avatarController.avatarPath = 'assets/images/goias.png';
                            SharedPreferences.getInstance().then((sp) {
                              sp.setString('avatar_path', 'assets/images/goias.png');
                            });
                            Navigator.of(context).pop();
                          },
                            child: SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Image.asset('assets/images/goias.png'))),
                          InkWell(onTap: () {
                            avatarController.avatarPath = 'assets/images/atletico.png';
                            SharedPreferences.getInstance().then((sp) {
                              sp.setString('avatar_path', 'assets/images/atletico.png');
                            });
                            Navigator.of(context).pop();
                          },
                            child: SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Image.asset('assets/images/atletico.png'))),
                      ], )
                              ],
                            ),
                )),
            Positioned(top: 8, left: 4, child: IconButton(icon: const Icon(Icons.close, color: Colors.blue,), onPressed: () {
              Navigator.of(context).pop();
            },))
          ],
        ),
      );
    },
  ).whenComplete(() {
    
  });
}

