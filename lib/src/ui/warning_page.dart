import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarningScreen extends StatelessWidget{
  static Widget create (BuildContext context) => WarningScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 105.0, 20, 0.0),
                color: Color(hexColor('#bef5ff')),
                child: _paginaDos(),
              ),
              SizedBox(height: 20),
              OutlineButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.home);
                }, 
                child: Text('Aceptar', style: TextStyle(color: Colors.blueAccent))
              )
            ]
      ),
      backgroundColor: Color(hexColor('#bef5ff')),
    );
  }

  final _estiloTitulo = new TextStyle(fontSize: 35.0, fontFamily: 'SourceSerifPro', letterSpacing: 5.0, fontWeight: FontWeight.bold, color: Color(hexColor('#ff3e18')));
  final _estiloDesc = new TextStyle(fontSize: 18.0, fontFamily: 'SourceSansPro', fontStyle: FontStyle.italic, color: Colors.black.withOpacity(0.8));

  Widget _paginaDos(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/intro_page/warning.png",
          width: 300.0,
        ),
        SizedBox(height: 50),
        Text('¡IMPORTANTE!',
          style: _estiloTitulo,
        ),
        SizedBox(height: 30),
        Text('El uso de esta aplicación no sustiye la terapia psicológica, sólo es una herramienta con ejercicios y consejos que te permitirán regular la ansiedad.\nEn caso de tener episodios constantes de ansiedad consulte a un profesional',
          textAlign: TextAlign.center,
          style: _estiloDesc,
        ),
      ],
    );
  }


}