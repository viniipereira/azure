
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class PaginaLoginWidget extends StatefulWidget {
  const PaginaLoginWidget({Key? key}) : super(key: key);

  @override
  _PaginaLoginWidgetState createState() => _PaginaLoginWidgetState();
}

class _PaginaLoginWidgetState extends State<PaginaLoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Login',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,

                    elevation: 5,
                    borderSide: BorderSide(
                      color: Color(0xFF39FF00),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
