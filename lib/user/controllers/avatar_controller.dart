

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';


part '../avatar_controller.g.dart';

class AvatarController = AvatarControllerBase with _$AvatarController;

abstract class AvatarControllerBase with Store {

  @observable
  String? avatarPath;

  void loadAvatarSaved() {
    SharedPreferences.getInstance().then((sp) {
      avatarPath = sp.getString('avatar_path');
    });
  }

}
