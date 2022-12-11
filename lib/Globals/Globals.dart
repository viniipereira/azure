import 'package:shared_preferences/shared_preferences.dart';

updateToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}

token_read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final read_value = prefs.getString(key) ?? 0;
  print('read: $read_value');
  return read_value;
}

get salvarToken => updateToken;