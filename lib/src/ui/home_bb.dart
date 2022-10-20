
import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBB extends StatelessWidget{

  static Widget create (BuildContext contex)=> HomeBB();

  // final authUser = (state as AuthSignedIn).user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnsiedAPP'),
        backgroundColor: Color(hexColor('#fcc9f7')),
      ),
      // floatingActionButton: _cerrarSesion(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: BlocBuilder<AuthCubit,AuthState>(
        buildWhen: (previous, current)=> current is AuthSignedIn,
        builder: (_,state){
          final authUser = (state as AuthSignedIn).user;
          return Column(
            children: [
              Expanded(child: 
                Text('user: ${authUser.uid}'),

              ),
              _cerrarSesion(context),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.widgets),
                    label: 'Ejercicios',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.lightbulb),
                    label: 'Ayuda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.help),
                    label: 'Informacion',
                  ),
                ],
                backgroundColor: Colors.red,
                // fixedColor: Colors.black,
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                //unselectedFontSize: 20.0,
                //unselectedIconTheme: IconThemeData(size: 30),
                selectedItemColor: Colors.deepPurple,
                elevation: 2.0,
                iconSize: 30.0,
                showUnselectedLabels: true,
                currentIndex: 0,
                // type: BottomNavigationBarType.shifting,
              )
            ],
          );
        }
      ),
      backgroundColor: Color(hexColor('#bef5ff')),
    );
  }


  Widget _cerrarSesion(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedSizeConstraints: BoxConstraints.tightFor(height: 60.0, width: 220.0)
      )
    ),
    child: FloatingActionButton.extended(
      onPressed: ()=>context.read<AuthCubit>().signOut(),
      //icon: Icon(Icons.play_arrow_rounded, size: 40.0),
      label: Text('CERRAR\nSESION', textAlign: TextAlign.center,),
      backgroundColor: Color(hexColor('#ff5930')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
      ),
      extendedIconLabelSpacing: 3.0,
      extendedPadding: EdgeInsets.only(left: 0.0, right: 15.0),
      elevation: 2,

    )
  );

}