import 'dart:math';

import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


final textS = TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final titulo = TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.white);
final textd = TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);
final textST = TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.black, );

Widget ejercicios(BuildContext context){
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    children: [
      Image.asset('assets/images/home_page/ejercicios_page/ejercicios.png', height: 150),
      Text('EJERCICIOS', style: titulo, textAlign: TextAlign.center,),
      SizedBox(height: 5),
      Text('Realizar los ejercicios te ayudara a mejorar tu estado de ánimo, centrándote en el aquí y ahora.', style: textS, textAlign: TextAlign.center,),
      SizedBox(height: 15),
      Column(
        children: [
          ejercicioRespiracion(context),
          ejercicioVista('Vista','Mira a tu alrededor y piensa en cinco cosas que observes. No te detengas en elegir, sólo nómbralas.', context),
          ejercicioOido('Oído','Identifica sonidos que puedas escuchar.', context),
          ejercicioTacto('Tacto','Encuentra cosas que puedas sentir.', context),
          ejercicioOlfato('Olfato','Halla olores. Puede ser alguna comida o fragancia.',context),
          ejercicioGusto('Gusto','Piensa en algo que puedas saborear.',context),
        ],
      ),
      SizedBox(height: 30),
      Container(
        // color: Colors.red,
        // padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Si lo prefieres, puedes reproducir una lista de reproduccion que te ayudara a relajarte', style: textS),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 50),
              child: _botonS('Reproduce una playlist', 'assets/images/home_page/logo_spotify.png', Color(hexColor('#8fdc08')), Color(hexColor('#5d5d5d'))),
            ),
          ],
        ),
      ),

    ],
  );
}


Widget ejercicio(String tit, String desc){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: Icon(Icons.play_arrow_rounded, size: 40),
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}

///VISTAAAAAA
Widget ejercicioVista(String tit, String desc, BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: ()=> Navigator.pushNamed(context, Routes.ejercicioVista),
          )
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, Routes.ejercicioVista),
              child: Text('Iniciar')
            ),
          ],
        ),
      ],
    ),
 );
}
///OIDO
Widget ejercicioOido(String tit, String desc, BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: ()=> Navigator.pushNamed(context, Routes.ejercicioVista),
          )
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, Routes.ejercicioOido),
              child: Text('Iniciar')
            ),
          ],
        ),
      ],
    ),
 );
}
///TACTO
Widget ejercicioTacto(String tit, String desc, BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: ()=> Navigator.pushNamed(context, Routes.ejercicioTacto),
          )
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, Routes.ejercicioTacto),
              child: Text('Iniciar')
            ),
          ],
        ),
      ],
    ),
 );
}
///TACTO
Widget ejercicioOlfato(String tit, String desc, BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: ()=> Navigator.pushNamed(context, Routes.ejercicioOlfato),
          )
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, Routes.ejercicioTacto),
              child: Text('Iniciar')
            ),
          ],
        ),
      ],
    ),
 );
}
///GUSTO
Widget ejercicioGusto(String tit, String desc, BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(tit),
          subtitle: Text(desc),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: ()=> Navigator.pushNamed(context, Routes.ejercicioTacto),
          )
          // leading: IconButton(Icons.play_arrow_rounded, size: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, Routes.ejercicioTacto),
              child: Text('Iniciar')
            ),
          ],
        ),
      ],
    ),
 );
}
Widget ejercicioRespiracion(BuildContext context){
  return Card(
    color: Color(0xFFdfcceb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Respira'),
          subtitle: Text('Respira de forma correcta'),
          // leading: Icon(Icons.play_arrow_rounded, size: 40),
          leading: IconButton(
            icon: Icon(Icons.play_arrow_rounded, size: 40,),
            onPressed: (){
                Navigator.pushNamed(context, Routes.respiracion);
              },
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.respiracion);
              },
              child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}


Widget ejercicioDos(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Oído'),
          subtitle: Text('Identifica cuatro sonidos que puedas escuchar. Pueden ser teclas pulsadas, la puerta, televisión, los coches.'),
          leading: Icon(Icons.play_arrow_rounded, size: 40,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}
Widget ejercicioTres(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Tacto'),
          subtitle: Text(''),
          leading: Icon(Icons.play_arrow_rounded, size: 40,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}
Widget ejercicioCuatro(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Olfato'),
          subtitle: Text(''),
          leading: Icon(Icons.play_arrow_rounded, size: 40,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}
Widget ejercicioCinco(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Olfato'),
          subtitle: Text(''),
          leading: Icon(Icons.play_arrow_rounded, size: 40,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}
Widget ejercicioSeis(){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    // margin: EdgeInsets.all(40),
    elevation: 8,
    child: Column(
      children: [
        ListTile(
          // scontentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text('Olfato'),
          subtitle: Text(''),
          leading: Icon(Icons.play_arrow_rounded, size: 40,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () => {}, child: Text('Iniciar'),),
          ],
        ),
      ],
    ),
 );
}

//boton de spotify

final Color color = Color(hexColor('#')); 
Widget _botonS(String text, String imagePath, Color color, Color textColor){
  return Material(
    color:  color,
    elevation: 3,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: InkWell(
      onTap: ()=>_hyperS(),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(imagePath, height: 35),
            SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
              color: Colors.black,
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

List<String> playlist = ["https://open.spotify.com/playlist/1rJ7HS2mav2FAxZMfsKYxb?si=a8e6a3c3dc794045",
  "https://open.spotify.com/playlist/0tAIZnGKLDznRZBBGhk0Of?si=GhLLIG63RQmSXstFyOYSqQ",
  "https://open.spotify.com/episode/3l3Y5wNSPiolgELfAUd8sl?si=nKAKKcW8SVelBIGSNIBdnA",
  "https://open.spotify.com/episode/185tnMyp5SK6BjrXC4ZIag?si=hCKBBYcHS0e2shGdHpXMmQ",
  "https://open.spotify.com/playlist/1nAd9W6i53T8QOiwFY3t1k?si=cb6e09dd309d4018",
  "https://open.spotify.com/playlist/6edz5ZAOKJj2UOLwYZb8c5?si=c5b0b9d4068447ed",
  "https://open.spotify.com/playlist/7DmhZlQIUSOVAeaYkmJzxo?si=a276179fb7304f25",
  "https://open.spotify.com/playlist/1VNaoCV8X6W9WXKItnDn44?si=9ca08763ca184ad4"];


Future<void> _hyperS() async {
  Random random = new Random();
  int r = random.nextInt(playlist.length);
  print("tamaño de pl ${playlist.length}");
  print(r);
  print(playlist[r]);
  String url = playlist[r];
  if (await canLaunch(url)) {
    await launch(url);
  } else {
     throw 'Could not launch $url';
  }
}

Future<void> _hyperL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
     throw 'Could not launch $url';
  }
}