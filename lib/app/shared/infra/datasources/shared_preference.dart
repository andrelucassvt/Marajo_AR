import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController {
  
  static final SharedPreferenceController _singleton = SharedPreferenceController._internal();
  factory SharedPreferenceController(){
    return _singleton;
  }
  SharedPreferenceController._internal();

  salvarAcesso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('valid', true);
  }
}