import 'package:aad_oauth_example/Globals/Globals.dart';
import 'package:flutter/material.dart';


class LogadoWidget extends StatefulWidget {
  const LogadoWidget({Key? key}) : super(key: key);

  @override
  _LogadoWidgetState createState() => _LogadoWidgetState();
}

class _LogadoWidgetState extends State<LogadoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    token_read()?print('sem token'):super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(1, 200, 200, 200),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 200, 200, 200),
        automaticallyImplyLeading: false,
        title: Text(
          'LOGADO MEU AMIGO',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
          child: TextButton(
            onPressed:(){ Navigator.pushNamed(context, "/semToken");}, child: Text("ir para la"),
          )
      ),
    );
  }
}