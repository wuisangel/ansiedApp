import 'dart:ui';

import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/ui/home_screen.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/src/provider.dart';

class IntroScreen extends StatelessWidget{

  static Widget create (BuildContext context) => IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Bienvenido"),
      ),*/
      body: _IntroPager(),
    );
  }
}

final _c1 = new Color(0x94ebfa);


class _IntroPager extends HookWidget{

  final int _nump = 0;
  final double _r =20.0, _l =20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageIndicatorContainer(
        child: PageView(
          children: [
            //contenedor de la pagina 1
            Container(
              padding: EdgeInsets.fromLTRB(_l, 105.0, _r, 0.0),
              color: Color(hexColor('#bef5ff')),
              child: _paginaUno(),
            ),
            //contenedor de la pagina 2
            Container(
              padding: EdgeInsets.fromLTRB(_l, 105.0, _r, 0.0),
              color: Color(hexColor('#bef5ff')),
              child: _paginaDos(),
            ),
            //contenedor de la pagina 3
            Container(
              padding: EdgeInsets.fromLTRB(_l, 105.0, _r, 0.0),
              color: Color(hexColor('#bef5ff')),
              child: _paginaTres(),
            ),
            //contenedor del loggeo
            Container(
              padding: EdgeInsets.fromLTRB(_l, 140.0, _r, 0.0),
              color: Color(hexColor('#bef5ff')),
              child: Column (
                children: [
                  _paginaCuatro(),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 50.0),
                        _loginButton(
                          text: 'Iniciar sesión con Google',
                          imagePath: 'assets/images/login/icon_google.png',
                          color: Colors.white,
                          textColor: Colors.grey,
                          onTap: ()=>context.read<AuthCubit>().signInWithGoogle(),
                        ),
                        SizedBox(height: 8),
                        _loginButton(
                          text: 'Iniciar con EMAIL',
                          imagePath: 'assets/images/login/icon_email.png',
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          onTap: (){
                            context.read<AuthCubit>().reset();
                            Navigator.pushNamed(context, Routes.loginEmail);
                          }
                        ),
                        SizedBox(height: 8),
                        _loginButton(
                          text: 'Iniciar en modo anonimo',
                          imagePath: 'assets/images/login/icon_anonimo.png',
                          color: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                          onTap: ()=>context.read<AuthCubit>().signInAnonymously(),
                        ),
                        SizedBox(height: 20),
                        OutlineButton(
                          onPressed: (){
                            context.read<AuthCubit>().reset();
                            Navigator.pushNamed(context, Routes.crearCuenta);
                          }, 
                          child: Text('Crea una cuenta', style: TextStyle(color: Colors.blueAccent))
                        )
                      ]
                    ),
                  ),
              ],
            )
            ),
          ],
        ),
        length: 4,
        //align: IndicatorAlign.center,
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 390.0),
        //slecciona el tipo de scroll
        shape: IndicatorShape.roundRectangleShape(size: Size(8.0,8.0), cornerSize: Size.square(3.0)),
        indicatorSpace: 13.0
      ),
      //boton para iniciar ejercicios de inmediato
      // floatingActionButton: _iniciarEjercicios(context),
      floatingActionButton: Row(
          children: [
            _iniciarEjercicios(context),
            SizedBox(width: 15),
            Text('Se registrara\nen modo anónimo', style: TextStyle(color: Colors.black.withOpacity(0.3)), textAlign: TextAlign.center)
            // SizedBox(width: 55),
            // _skip(context)
          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  //boton para proceder directo a los ejercicios
  Widget _iniciarEjercicios(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedSizeConstraints: BoxConstraints.tightFor(height: 50.0, width: 220.0)
      )
    ),
    child: FloatingActionButton.extended(
      // onPressed: ()=>context.read<AuthCubit>().signInAnonymously(),
      onPressed: (){
        context.read<AuthCubit>().signInAnonymously();
      },
      icon: Icon(Icons.play_arrow_rounded, size: 40.0),
      label: Text('INICIAR EJERCICIOS', textAlign: TextAlign.center,),
      backgroundColor: Color(hexColor('#ff5930')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
      ),
      extendedIconLabelSpacing: 3.0,
      extendedPadding: EdgeInsets.only(left: 0.0, right: 15.0),
      elevation: 2,
    )
  );

  //boton para omitir el onboarding
  Widget _skip(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedSizeConstraints: BoxConstraints.tightFor(height: 40.0, width: 80.0),
      )
    ),
    child: FloatingActionButton.extended(
      onPressed: (){},
      label: Text('Skip', textAlign: TextAlign.center, style: TextStyle(color: Color(hexColor('#442fb0')))),
      backgroundColor: Color(hexColor('#bef5ff')),
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(width: 1, color: Color(hexColor('#442fb0')))
      ),
      extendedIconLabelSpacing: 3.0,
      // extendedPadding: EdgeInsets.only(left: 0.0, right: 15.0),
    )
  );

  final _estiloTitulo = new TextStyle(fontSize: 35.0, fontFamily: 'SourceSerifPro', letterSpacing: 5.0, fontWeight: FontWeight.bold, color: Color(hexColor('#442fb0')));
  final _estiloTituloL = new TextStyle(fontSize: 22.0, fontFamily: 'SourceSerifPro', fontWeight: FontWeight.bold, color: Color(hexColor('#442fb0')));
  final _estiloDesc = new TextStyle(fontSize: 18.0, fontFamily: 'SourceSansPro', fontStyle: FontStyle.italic, color: Colors.black.withOpacity(0.8));

  Widget _paginaUno(){    
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/intro_page/1.png",
          width: 300.0,
        ),
        //Expanded(child: SizedBox()),
        SizedBox(height: 100),
        Text('ANSIEDAPP',
          style: _estiloTitulo,
        ),
        SizedBox(height: 30),
        Text('AnsiedAPP es una aplicación que tiene como objetivo reducir los síntomas de la ansiedad, mediante ejercicios de relajación, respiración y otras técnicas.\nNo sustituye la terapia psicológica.',
          textAlign: TextAlign.center,
          style: _estiloDesc,
        ),
      ],
    );
  }


  Widget _paginaDos(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/intro_page/2.png",
          width: 300.0,
        ),
        SizedBox(height: 100),
        Text('BE BETTER',
          style: _estiloTitulo,
        ),
        SizedBox(height: 30),
        Text('Además de ayudar a controlar los ataques, AnsiedAPP también busca ayudarte a tener mejorías en tu bienestar emocional, dándote tips y facilitándote información para que puedas comprender por qué te sientes así.',
          textAlign: TextAlign.center,
          style: _estiloDesc,
        ),
      ],
    );
  }

  Widget _paginaTres(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/intro_page/3.png",
          width: 300.0,
        ),
        SizedBox(height: 100),
        Text('REGISTRATE',
          style: _estiloTitulo,
        ),
        SizedBox(height: 30),
        Text('Registrarte e iniciar sesión te permitirá llevar un control de tus avances, así como elegir y calificar los mejores ejercicios para ti. Ademas, cuentas con herramientas útiles, por ejemplo, contar con un contacto de emergencia.',
          textAlign: TextAlign.center,
          style: _estiloDesc,
        ),
      ],
    );
  }

  Widget _paginaCuatro(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/intro_page/4.png",
          width: 200.0,
        ),
        SizedBox(height: 30),
        Text('INICIA SESIÓN O CREA UNA CUENTA',
          textAlign: TextAlign.center,
          style: _estiloTituloL,
        ),
        //SizedBox(height: 30),
        //Text('Registrarte e iniciar sesión te permitira llevar un control de tu progreso, así como elegir y calificar los mejores ejercicios para ti. Así mismo cuentas con herramientas utiles, como por ejemplo, contar con un contacto de emergencia.',
        //  textAlign: TextAlign.center,
        //  style: _estiloDesc,
        //),
      ],
    );
  }

}


class _loginButton extends StatelessWidget{
  final String text;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;
  const _loginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color:  color,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}