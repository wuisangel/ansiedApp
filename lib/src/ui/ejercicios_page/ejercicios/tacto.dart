// import 'package:flutter/cupertino.dart';
import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/utils/boton_widget.dart';
import 'package:flutter/material.dart';

class TactoPage extends StatefulWidget{

  static Widget create(BuildContext context) => TactoPage();

  @override
  State<StatefulWidget> createState() => _TactoPage();

}

class _TactoPage extends State<TactoPage>{

  bool _value = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
              onPressed: () => Navigator.pushNamed(context, Routes.home),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Tacto', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page/ejercicios_page/bg_tacto.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 600,
            height: 700,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Encuentra tres cosas que puedas sentir. Por ejemplo: silla, camisa, accesorios.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),),
                    SizedBox(height: 90,),
                    checkUno('Primer Objeto','Celular, zapatos, cartera, etc.'),
                    SizedBox(height: 15),
                    checkDos('Segundo Objeto', 'Celular, zapatos, cartera, etc.'),
                    SizedBox(height: 15),
                    checkTres('Tercer Objeto', 'Celular, zapatos, cartera, etc.'),
                    SizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EjercicioAnterior(
                          text: 'Ejercicio Anterior',
                          bgColor: Colors.blueGrey,
                          color: Colors.white,
                          onClicked: () => Navigator.pushNamed(context, Routes.ejercicioOido),
                        ),
                        SizedBox(width: 20),
                        SiguienteEjercicio(
                          text: 'Siguiente Ejercicio',
                          bgColor: Colors.blueGrey,
                          color: Colors.white,
                          onClicked: ()=> Navigator.pushNamed(context, Routes.ejercicioOlfato),
                        )
                      ],
                    )
                  ],
                ), //Container
              ), //Padding
            ), //Center
          ),
        ),
      ),
    );
  }

  Widget checkUno(String _tit, String des){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFc9d8df),
        border: Border.all(color: Color(0xFFffd5c7)),
        borderRadius: BorderRadius.circular(10),
      ), //
      width: 300, 
      child: Column(
        children: [
          if(_value == false)
            CheckboxListTile(
              title: Text(_tit, style: TextStyle(fontSize: 15),),
              subtitle:
                  Text(des, style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value,
              dense: true,
              value: _value,
              onChanged: (bool? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          if(_value)
            CheckboxListTile(
              title: Text('LISTO!', style: TextStyle(fontSize: 15),),
              subtitle:
                  Text('EXCELENTE', style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value,
              dense: true,
              value: _value,
              onChanged: (bool? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
        ],
      ),
    );
  }
  Widget checkDos(String _tit, String des){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFc9d8df),
        border: Border.all(color: Color(0xFFffd5c7)),
        borderRadius: BorderRadius.circular(10),
      ), //
      width: 300, 
      child: Column(
        children: [
          if(_value2 == false)
            CheckboxListTile(
              title: Text(_tit, style: TextStyle(fontSize: 15),),
              subtitle:
                  Text(des, style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value2,
              dense: true,
              value: _value2,
              onChanged: (bool? value) {
                setState(() {
                  _value2 = value!;
                });
              },
            ),
          if(_value2)
            CheckboxListTile(
              title: Text('LISTO!', style: TextStyle(fontSize: 15),),
              subtitle:
                  Text('GRANDIOSO', style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value2,
              dense: true,
              value: _value2,
              onChanged: (bool? value) {
                setState(() {
                  _value2 = value!;
                });
              },
            ),
        ],
      ),
    );
  }
  Widget checkTres(String _tit, String des){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFc9d8df),
        border: Border.all(color: Color(0xFFffd5c7)),
        borderRadius: BorderRadius.circular(10),
      ), //
      width: 300, 
      child: Column(
        children: [
          if(_value3 == false)
            CheckboxListTile(
              title: Text(_tit, style: TextStyle(fontSize: 15),),
              subtitle:
                  Text(des, style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value3,
              dense: true,
              value: _value3,
              onChanged: (bool? value) {
                setState(() {
                  _value3 = value!;
                });
              },
            ),
          if(_value3)
            CheckboxListTile(
              title: Text('LISTO!', style: TextStyle(fontSize: 15),),
              subtitle:
                  Text('FELICIDADES', style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value3,
              dense: true,
              value: _value3,
              onChanged: (bool? value) {
                setState(() {
                  _value3 = value!;
                });
              },
            ),
        ],
      ),
    );
  }
  Widget checkCuatro(String _tit, String des){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFc9d8df),
        border: Border.all(color: Color(0xFFffd5c7)),
        borderRadius: BorderRadius.circular(10),
      ), //
      width: 300, 
      child: Column(
        children: [
          if(_value4 == false)
            CheckboxListTile(
              title: Text(_tit, style: TextStyle(fontSize: 15),),
              subtitle:
                  Text(des, style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value4,
              dense: true,
              value: _value4,
              onChanged: (bool? value) {
                setState(() {
                  _value4 = value!;
                });
              },
            ),
          if(_value4)
            CheckboxListTile(
              title: Text('LISTO!', style: TextStyle(fontSize: 15),),
              subtitle:
                  Text('FELICIDADES', style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value4,
              dense: true,
              value: _value4,
              onChanged: (bool? value) {
                setState(() {
                  _value4 = value!;
                });
              },
            ),
        ],
      ),
    );
  }
  Widget checkCinco(String _tit, String des){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFc9d8df),
        border: Border.all(color: Color(0xFFffd5c7)),
        borderRadius: BorderRadius.circular(10),
      ), //
      width: 300, 
      child: Column(
        children: [
          if(_value5 == false)
            CheckboxListTile(
              title: Text(_tit, style: TextStyle(fontSize: 15),),
              subtitle:
                  Text(des, style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value5,
              dense: true,
              value: _value5,
              onChanged: (bool? value) {
                setState(() {
                  _value5 = value!;
                });
              },
            ),
          if(_value5)
            CheckboxListTile(
              title: Text('LISTO!', style: TextStyle(fontSize: 15),),
              subtitle:
                  Text('FELICIDADES', style: TextStyle(fontSize: 14),),
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value5,
              dense: true,
              value: _value5,
              onChanged: (bool? value) {
                setState(() {
                  _value5 = value!;
                });
              },
            ),
        ],
      ),
    );
  }
}