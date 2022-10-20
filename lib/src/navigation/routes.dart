import 'package:ansiedapp/src/ui/ejercicios.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/gusto.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/oido.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/olfato.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/respiracion/respiracion.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/tacto.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/vista.dart';
import 'package:ansiedapp/src/ui/email_create_screen.dart';
import 'package:ansiedapp/src/ui/email_login_screen.dart';
import 'package:ansiedapp/src/ui/home_bb.dart';
import 'package:ansiedapp/src/ui/home_page.dart';
import 'package:ansiedapp/src/ui/home_screen.dart';
import 'package:ansiedapp/src/ui/home_screen_dos.dart';
import 'package:ansiedapp/src/ui/intro_screen.dart';
import 'package:ansiedapp/src/ui/warning_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes{
  static const intro = '/';
  static const advertencia = '/advertencia';
  static const home = '/home';
  static const crearCuenta = '/crearCuenta';
  static const loginEmail = '/loginEmail';
  static const ejercicios = '/ejercicios';
  static const respiracion = '/ejercicios/respiracion';
  static const ejercicioVista = '/ejercicios/ejercicioVista';
  static const ejercicioOido = '/ejercicios/ejercicioOido';
  static const ejercicioTacto = '/ejercicios/ejercicioTacto';
  static const ejercicioOlfato = '/ejercicios/ejercicioOlfato';
  static const ejercicioGusto = '/ejercicios/ejercicioGusto';

  static Route routes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case intro:
        return _buildRoute(IntroScreen.create);
      case advertencia:
        return _buildRoute(WarningScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      // case home:
      //   return _buildRoute(HomePage.create);
      case crearCuenta:
        return _buildRoute(EmailCreate.create);
      case loginEmail:
        return _buildRoute(EmailLogin.create);
      // case ejercicios:
      //   return _buildRoute(ejerciciosCreate.create);
      case respiracion:
        return _buildRoute(RespiracionPage.create);
      case ejercicioVista:
        return _buildRoute(VistaPage.create);
      case ejercicioOido:
        return _buildRoute(OidoPage.create);
      case ejercicioTacto:
        return _buildRoute(TactoPage.create);
      case ejercicioOlfato:
        return _buildRoute(OlfatoPage.create);
      case ejercicioGusto:
        return _buildRoute(GustoPage.create);
      default:
        throw Exception('No existe la ruta');
    }
  }

  static MaterialPageRoute _buildRoute(Function build)=>
    MaterialPageRoute(builder: (context)=>build(context));
}