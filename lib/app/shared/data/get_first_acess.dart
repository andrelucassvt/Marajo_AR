import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(singleton: true)
class GetFirstAcess {

  salvarAcesso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('valid', true);
  }
}