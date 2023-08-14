import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:note_sync/projects/controllers/projeto_controller.dart';
import 'package:note_sync/projects/widgets/modals.dart';
import 'package:note_sync/shared/colors.dart';
import 'package:note_sync/shared/text_field.dart';

class ProjectsTabWidget extends StatelessWidget {
  ProjectsTabWidget({super.key});

  final projetoController = GetIt.instance<ProjetoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff595d63),
        title: const Text('NoteSync'),
        actions: [
          IconButton(
              onPressed: () {
                showProjectCreationModal(context, projetoController);
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 500));
          projetoController.getProjetosCriados();
        },
        child: Observer(builder: (context) {
          // projetoController.state = ProjetosState.loading;
          switch (projetoController.projetosState) {
            case ProjetosState.loading:
              return Center(
                child: SizedBox(width: MediaQuery.of(context).size.width * 0.5,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.ballScaleRipple,
                    colors: [Color(0xffa5abba)],
                    strokeWidth: 3, 
                
                          ),
                ),
              );
            case ProjetosState.empty:
              return Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Image.asset('assets/images/ghost.webp'),
                    ),
                    const SizedBox(height: 24,),
                    const Text(
                      'Parece que você não criou\nnenhum projeto ainda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffa5abba),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              );
            case ProjetosState.loaded:
            case ProjetosState.filtering:
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: CustomTextField(
                          onChanged: (text) {
                            projetoController.filterListProjetos(text);
                          },
                          prefixIcon: Icons.search,
                        )),
                    const Text(
                      'WORKSPACE',
                      style: TextStyle(
                          color: Color(0xffa5abba),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.person_2_outlined,
                          color: Color(0xffa5abba),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Meus projetos',
                          style: TextStyle(
                              color: Color(0xffa5abba),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'Boards',
                          style: TextStyle(
                              color: Color(0xff629df1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color(0xff629df1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Color(0xff3b3b3e), width: 2),
                    ),
                    color: Color(0xff1c1c1e)),
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    // List<Color> colors = colorsList[index];
                    var projeto =
                        (projetoController.projetosState == ProjetosState.filtering
                            ? projetoController.projetosFiltrados
                            : projetoController.projetos)[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/projetoPage', arguments: projeto.id);
                        projetoController.getProjetoById(projeto.id!);
                      },
                      child: Slidable(
                        key: Key('slidable$index'),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) async {
                                try {
                                  EasyLoading.show(status: 'Excluindo', dismissOnTap: false, indicator: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ));
                                  await projetoController.deleteProjeto(projeto.id!);
                                  EasyLoading.dismiss();
                                } catch (e) {
                                  EasyLoading.dismiss();
                                  EasyLoading.showError('Erro ao excluir projeto');
                                }
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Excluir',
                            ),
                            SlidableAction(
                              onPressed: (_) {
                                showModalEdit(
                                    context, projetoController, projeto);
                              },
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Editar',
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: projeto.gradient ?? []),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                height: 32,
                                width: 32,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(projeto.nome!,
                                        style: const TextStyle(
                                            color: Color(0xffa5abba),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(projeto.descricao!,
                                        style: const TextStyle(
                                            color: Color(0xffa5abba),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: projetoController.projetosState == ProjetosState.filtering
                      ? projetoController.projetosFiltrados.length
                      : projetoController.projetos.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Color(0xff3b3b3e),
                      indent: 48,
                      height: 2,
                      thickness: 2,
                    );
                  },
                ),
              ),
              const SizedBox(height: 32,)
            ],
          );
          default:
            return ListView(children: [
              
            ]);
          }
        
        }),
      ),
    );
  }
}


