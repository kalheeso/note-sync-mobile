import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:note_sync/projects/controllers/projeto_controller.dart';
import 'package:note_sync/projects/models/projeto_solo.dart';

class ProjetoPageWidget extends StatefulWidget {
  const ProjetoPageWidget({super.key});

  @override
  State<ProjetoPageWidget> createState() => _ProjetoPageWidgetState();
}

class _ProjetoPageWidgetState extends State<ProjetoPageWidget> {

  final projetoController = GetIt.instance<ProjetoController>();

  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    projetoController.currentProjeto = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Color(0xff595d63),
            title: Text(projetoController.currentProjeto?.nome ?? 'Projeto'),
            actions: [
              IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(
                    Icons.add,
                  ))
            ],
          ),
          body: Builder(
            builder: (context) {
              switch (projetoController.currentProjetoState) {
                case CurrentProjetoState.loading:
                return Center(
                  child: SizedBox(width: MediaQuery.of(context).size.width * 0.5,
                    child: const LoadingIndicator(
                      indicatorType: Indicator.ballScaleRipple,
                      colors: [Color(0xffa5abba)],
                      strokeWidth: 3,),
                  ),
                );
                case CurrentProjetoState.loaded:
                  return PageView(controller: pageController,
                    children: [
                      
                  ]);
                case CurrentProjetoState.empty:
                  return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Image.asset('assets/images/ghost.webp'),
                        ),
                        const SizedBox(height: 24,),
                        const Text(
                          'Parece que você não criou\nnenhuma etapa ainda',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffa5abba),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }

            }
          ),
        );
      }
    );
  }
}