// import 'package:flutter/cupertino.dart';
import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/utils/boton_widget.dart';
import 'package:flutter/material.dart';

class GustoPage extends StatefulWidget{

  static Widget create(BuildContext context) => GustoPage();

  @override
  State<StatefulWidget> createState() => _GustoPage();

}

class _GustoPage extends State<GustoPage>{

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
        title: Text('Gusto', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page/ejercicios_page/bg_gusto.png'),
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
                    Text('Piensa en una cosa que puedas saborear. Desde una menta hasta el interior de tu boca.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),),
                    SizedBox(height: 110,),
                    checkUno('Identifica un sabor','Un dulce, tu boca, etc.'),
                    SizedBox(height: 110),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        EjercicioAnterior(
                          text: 'EjercicioAnterior',
                          bgColor: Colors.blueGrey,
                          color: Colors.white,
                          onClicked: ()=>Navigator.pushNamed(context, Routes.ejercicioOlfato),
                        ),
                        SizedBox(width: 20),
                        terminar(),
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
  

  Widget terminar(){
    return Material(
    color:  Colors.blueGrey,
    elevation: 3,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: InkWell(
      onTap: ()=>Navigator.pushNamed(context, Routes.home),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              'Terminar',
              style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            // SizedBox(width: 5),
            Icon(Icons.check, color: Colors.white,)
          ],
          )
        ),
      ),
    );
  }
}