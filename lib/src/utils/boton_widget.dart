import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiguienteEjercicio extends StatelessWidget{
  final String text;
  final Color color;
  final Color bgColor;
  final VoidCallback onClicked;

  const SiguienteEjercicio({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.bgColor = Colors.black,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
    color:  bgColor,
    elevation: 3,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
              color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            // SizedBox(width: 5),
            Icon(Icons.arrow_forward_ios, color: Colors.white,)
          ],
          )
        ),
      ),
    );
  }

  
}

class EjercicioAnterior extends StatelessWidget{
  final String text;
  final Color color;
  final Color bgColor;
  final VoidCallback onClicked;

  const EjercicioAnterior({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.bgColor = Colors.black,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
    color:  bgColor,
    elevation: 3,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    child: InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: Colors.white,),
            Text(
              text,
              style: TextStyle(
              color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            // SizedBox(width: 5),
          ],
          )
        ),
      ),
    );
  }

  
}