import 'dart:async';

import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/ui/cards_page/cards.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios/respiracion/button_widget.dart';
import 'package:ansiedapp/src/utils/boton_widget.dart';
import 'package:flutter/material.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';

class RespiracionPage extends StatefulWidget{

  static Widget create(BuildContext context) => RespiracionPage();

  @override
  State<StatefulWidget> createState() => _RespiracionPageState();
}

class _RespiracionPageState extends State<RespiracionPage>{

  static const maxSeconds = 8;
  int seconds = maxSeconds;
  Timer? timer;

  void resetTimer() => setState(()=>seconds = maxSeconds);

  void startTimer({bool reset = true}) {
    if(reset){
      resetTimer();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if(seconds > 0)
        setState(()=>seconds--);
      else
        stopTimer();

      // if(seconds == 0)
      //   startTimer();

    });
  }

  void stopTimer({bool reset = true}) {
    if(reset)
      resetTimer();
    setState(()=> timer?.cancel());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pushNamed(context, Routes.home),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Respiración'),
        centerTitle: true,
      ), 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page/ejercicios_page/bg_respiracion.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimer(),
              const SizedBox(height: 80),
              buildButtons(),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SiguienteEjercicio(
                    bgColor: Colors.blueGrey,
                    color: Colors.white,
                    text: 'Siguiente Ejercicio',
                    onClicked: ()=> Navigator.pushNamed(context, Routes.ejercicioVista)
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget buildButtons(){
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;
    return isRunning
    ? Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: isRunning ? 'Pausar' : 'Reanudar',
              onClicked: (){
                if(isRunning){
                  stopTimer(reset: false);
                }else{
                  startTimer(reset: false);
                }
              }
            ),
            const SizedBox(width: 10),
            ButtonWidget(
              text: 'Cancelar',
              onClicked: (){
                stopTimer();
              }
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Inhala lenta y profundamente', 
            style: TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    )
    : ButtonWidget(
        text: 'Iniciar',
        color: Colors.black,
        bgColor: Colors.white,
        onClicked: (){
          startTimer();
        },
      );
  }

  Widget buildTimer(){
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: seconds / maxSeconds,
            strokeWidth: 15,
          ),
          Center(child: buildTime())
        ],
      ),
    );
  }

  Widget buildTime(){
    return Text(
      '$seconds',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 80
      ),
    );
  }
}

