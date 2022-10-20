import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/material.dart';
final textS = TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final titulo = TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.white);
final textd = TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final textST = TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.black, );

Widget tarjetas(){
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
    children: <Widget> [
      Image.asset('assets/images/home_page/informate_page/informate.png', height: 240.0),
      Text('INFÓRMATE', style: titulo, textAlign: TextAlign.center),
      SizedBox(height: 10.0),
      Text('Aquí encontraras información relacionada al trastorno de la ansiedad.', style: textS, textAlign: TextAlign.center),
      SizedBox(height: 10.0),
      _cardtipo1(),// titulo de ¿que es ansiedad
      SizedBox(height: 10.0),
      _cardtipo4(),// sintomas titulo
      SizedBox(height: 30.0),
      _cardtipo7(),//cuasas titlulo
      SizedBox(height: 10.0),
      _cardtipo1(),// titulo de ¿que es ansiedad
      SizedBox(height: 10.0),
      _cardtipo4(),// sintomas titulo
      SizedBox(height: 30.0),
      _cardtipo7(),//cuasas titlulo
      SizedBox(height: 10.0),
      _cardtipo1(),// titulo de ¿que es ansiedad
      SizedBox(height: 10.0),
      _cardtipo4(),// sintomas titulo
      SizedBox(height: 30.0),
      _cardtipo7(),//cuasas titlulo
      SizedBox(height: 10.0),
    ],
  );
}

Widget _cardtipo1() {

  return Card (
    color: Color(hexColor('#c7fede')),
    child: Column(
      children: <Widget> [
        ListTile(
          title: Text('¿Que es la Ansiedad?'),
          subtitle: Text('La ansiedad es una emoción normal que se experimenta en situaciones en las que el sujeto se siente amenazado por un peligro externo o interno.')
        ),
        Image.asset('assets/images/home_page/informate_page/card_1.jpg'),
        // Image.asset('assets/images/home_page/informate_page/informate.png'),
        ListTile(
          subtitle: Text('La ansiedad es anormal cuando es desproporcionada y demasiado prolongada para el estímulo desencadenante')
        )
      ],
    ),
  );
}
Widget _cardtipo2() {
  return Card(
    color: Color(hexColor('#9C8F9C')),
    child: Column(
      children: <Widget>[
        Image(
          image: NetworkImage('https://as01.epimg.net/deporteyvida/imagenes/2020/03/02/portada/1583142327_324441_1583142752_noticia_normal_recorte1.jpg'),
        )
      ],
    ),
  );
}
Widget _cardtipo3() {

  return Card (
    child: Column(
      children: <Widget> [
        ListTile(
            subtitle: Text('La ansiedad es una emoción normal que se experimenta en situaciones en las que el sujeto se siente amenazado por un peligro externo o interno.  La ansiedad es anormal cuando es desproporcionada y demasiado prolongada para el estímulo desencadenante')
        )
      ],
    ),
  );
}
Widget _cardtipo4() {

  return Card (
    child: Column(
      children:  [
        Image.asset('assets/images/home_page/informate_page/card_sintomas.jpg'),
        // Image.asset('assets/images/home_page/informate_page/informate.png'),
        ListTile(
            title: Text('¿Cuales son los sintomas?'),
            subtitle: Text('Palpitaciones, angustia, sensacion de ahogo y fobias.')
        ),
      ],
    ),
  );
}
Widget _cardtipo5() {
  return Card(
    child: Column(
      children: <Widget>[
        Image(
          image: NetworkImage('https://as01.epimg.net/deporteyvida/imagenes/2020/03/02/portada/1583142327_324441_1583142752_noticia_normal_recorte1.jpg'),
        )
      ],
    ),
  );
}
Widget _cardtipo6() {

  return Card (
    child: Column(
      children:  [
        ListTile(

            subtitle: Text(' Las palpitaciones, sentir angustia, sensacion de ahogo y fobias.'),

        )
      ],
    ),
  );
}
Widget _cardtipo7() {

  return Card (
    child: Column(
      children: <Widget> [
        ListTile(
            title: Text('¿Cuales son las causas de la Ansiedad?'),
            subtitle: Text('Las causas fundamentales son los factores genéticos, existiendo una predisposición al trastorno, aunque se desconoce su contribución exacta y el tipo de educación en la infancia y la personalidad, presentando mayor riesgo aquellas personas con dificultad para afrontar los acontecimientos estresantes.')
        )
      ],
    ),
  );
}