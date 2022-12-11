import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth_example/Globals/Globals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Paginas/Logado.dart';

void main() async => runApp(MyApp());




final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAD OAuth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AAD OAuth Home'),
      navigatorKey: navigatorKey
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final Config config = Config(
      tenant: '53b0111b-4655-4a2b-bf50-a1adeaa31ff5',
      clientId: '43bb0595-3f50-4e2f-a7be-0489f7a9b869',
      scope: 'openid profile offline_access',
      clientSecret: '2g88Q~Cswg5kBnzZi.rsBcsUXKzAfYArEOR~qa8d',
      navigatorKey: navigatorKey,
      loader: SizedBox());
  final AadOAuth oauth = AadOAuth(config);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: <Widget>[
          Image.asset('assets/images/logo.png',

          width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.3,
      fit: BoxFit.fitWidth,),
            ListTile(
              leading: Icon(Icons.launch),
              title: Text('Login '),
              onTap: () {
                login(true);
              },
            ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(bool redirect) async {
    config.webUseRedirect = redirect;
    final result = await oauth.login();
    result.fold(
      (l) => showError(l.toString()),
      (r) => updateToken(r.toString()),
    );
    var accessToken = await oauth.getAccessToken();


    if (accessToken != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(accessToken)));
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }
}
