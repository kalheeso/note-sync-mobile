

import 'package:mobx/mobx.dart';
import 'package:note_sync/login_and_register/models/cadastro_login_response.dart';
import 'package:note_sync/login_and_register/models/cadastro_usuario_response.dart';
import 'package:note_sync/login_and_register/services/login_services.dart';
import 'package:note_sync/shared/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'root_controller.g.dart';

class RootController = RootControllerBase with _$RootController;

abstract class RootControllerBase with Store {


  @observable
  int currentIndex = 0;


}