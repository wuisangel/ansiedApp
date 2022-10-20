import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ejerciciosCreate extends StatefulWidget{
  static Widget create(BuildContext context) => ejerciciosCreate();

  @override
  State<StatefulWidget> createState() => _ejerciciosCreateState();

}

class _ejerciciosCreateState extends State<ejerciciosCreate>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicios')),
      body: Text('Ejercicio 1'),
    );
  }
}