import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final textS = TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final titulo = TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.white);
final textd = TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final textST = TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.white, );



Widget ayudad(){
  return Padding(
    padding: EdgeInsets.all(20),
    child: ListView(
      children: [
        Image.asset('assets/images/home_page/ayuda_page.png', height: 240.0),
        Text('AYUDA', style: titulo, textAlign: TextAlign.center),
        Text('Esta sección te brindara información acerca de instituciones gubernamentales o gratuitas a las que podras acudir o comunicarte.',
        textAlign: TextAlign.center, style: textS),
        SizedBox(height: 40),
        _institucion('DIF',
          'Te recomendamos acudir a tu DIF mas cercano, debido a que, por ley, el gobierno tiene la obligación de brindarte ayuda psicologica gratuita.'),
        Row(
          children: [
            _hyperLink('Localiza tu DIF mas cercano: ', 'Encontrar','https://google.com.mx/maps/search/DIF'),
            Icon(Icons.location_on, color: Color(hexColor('#f3531b')))
          ],
        ),
        SizedBox(height: 20),
        _institucion('Centro de atención ciudadana: La Línea de la Vida',
          'Acércate a la Línea de la Vida para solicitar asesoría especializada sobre prevención y atención en el consumo de sustancias adictivas, este servicio es gratuito y confidencial. Funciona las 24 horas de los 365 días del año a nivel nacional.'),
        Row(
          children: [
            _hyperLink('Telefono: ', '01800 911 2000','tel://018009112000'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),
        SizedBox(height: 20),
        _institucion('BUAP (Benemérita Universidad Autónoma de Puebla)',
          'Si eres estudiante activo de la BUAP puedes solicitar atención psicológica, otorgada por profesionales de la salud mental, de manera gratuita y confidencial.\nPara mas información contactalos.'),
        Row(
          children: [
            _hyperEmail('Email: ','dau.bienestaremocional@correo.buap.mx','dau.bienestaremocional@correo.buap.mx'),
            Icon(Icons.email, size: 18)
          ],
        ),
        SizedBox(height: 20),
        _institucion('Línea de Atención Psicológica Call Center (UNAM) especializada en salud mental',
          'Profesionales de la Facultad de Psicología ofrecen asistencia de primer contacto en problemas de ansiedad, depresión, crisis de pánico, entre otros. La comunidad universitaria, en especial los estudiantes, son el principal grupo de atención, aunque debido al incremento en el número de consultas se puso a disposición de la población en general.\nCuenta con seis líneas, de lunes a viernes, de 8 a 18 hrs.'),
        Row(
          children: [
            _hyperLink('Teléfono: ','55-5025-0855','tel://5550250855'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),
        SizedBox(height: 20),
        _institucion('Consejería SAPTEL',
          'El Sistema Nacional de Apoyo, Consejo Psicológico e Intervención en Crisis por Teléfono, ofrece un servicio de terapia psicológica gratuita facilitada por psicólogos certificados.\n24 hrs. los 365 días.'),
        Row(
          children: [
            _hyperLink('Teléfono: ','800-472-7835','tel://8004727835'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),
        SizedBox(height: 20),
        _institucion('Fundación Origen',
          'ONG enfocada en el apoyo social a personas en situación de exclusión o desamparo, la “Línea de Ayuda Origen” ofrece asistencia psicológica gratuita vía telefónica.\n08:00 a 22:00 hrs (Lunes a Domingo)'),
        Row(
          children: [
            _hyperLink('Teléfono: ','800-015-1617','tel://8000151617'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),        
        SizedBox(height: 20),
        _institucion('CONADIC (Adicciones)',
          'La Comisión Nacional de las Adicciones ofrece asistencia psicológica gratuita, intervención en crisis y centros de tratamiento recomendados para adictos a sustancias y sus familiares.\n24 hrs. los 365 días'),
        Row(
          children: [
            _hyperLink('Teléfono: ','800-710-0900','tel://8007100900'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),        
        Row(
          children: [
            _hyperLink('Teléfono: ','800-911-2000','tel://8009112000'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),        
        SizedBox(height: 20),
        _institucion('CIJ. Integración Juvenil',
          'El Centro de Integración Juvenil cuenta con servicio telefónico de apoyo psicológico gratuito para jóvenes adictos, brinda información sobre la prevención y tratamiento de las adicciones.'),
        Row(
          children: [
            _hyperLink('Teléfono: ','555-212-1212','tel://2121212'),
            Icon(Icons.phone_enabled_sharp, size: 18)
          ],
        ),      
        Row(
          children: [
            _hyperLink('WhatsApp: ','222-304-8969','https://wa.me/522223048969'),
            Icon(Icons.message, size: 18)
          ],
        ),      
      ],
    )
  );
}

Widget _institucion(String titulo, String des){
  return Column(
    children: [
      Text(titulo, style: textST, textAlign: TextAlign.left),
      Text(des, style: textd)
    ],
  );
}

Widget _hyperLink(String texto,String textoL,String url){
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          style: textd,
          text: texto
        ),
        TextSpan(
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          text: textoL,
          recognizer: TapGestureRecognizer()..onTap = ()=>_hyperL(url)
        ),
      ]
    )
  );
}


Widget _hyperEmail(String texto,String textoL,String url){
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          style: textd,
          text: texto
        ),
        TextSpan(
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          text: textoL,
          recognizer: TapGestureRecognizer()..onTap = ()=>_email(url)
        ),
      ]
    )
  );
}


//funciones de implementacion de url_launch
Future<void> _hyperL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
}

Future<void> _email(String email) async {

  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=App Feedback&body=App Version 3.23', //add subject and body here
  );

  var url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $email';
  }
}
