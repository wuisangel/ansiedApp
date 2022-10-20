
import 'dart:io';
import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/bloc/my_user_cubit.dart';
import 'package:ansiedapp/src/model/user.dart';
import 'package:ansiedapp/src/repository/auth_repository.dart';
import 'package:ansiedapp/src/repository/implementations/my_user_repository.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios.dart';
import 'package:ansiedapp/src/ui/help_page/ayuda.dart';
import 'package:ansiedapp/src/ui/home_screen.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "cards_page/cards.dart";

import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget{
  static Widget create (BuildContext contex) => HomePage();
  // static Widget create (BuildContext contex) {
  //   return BlocProvider(
  //     create: (_)=>MyUserCubit(MyUserRepository()..getMyUSer()),
  //     child:  HomePage()
  //   );
  // }
  
  // const HomePage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState()=>_HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  static const _kTabPages = <Widget>[
    // _tabUno,
    // _tabDos,
    // Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];

  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.play_circle), text: 'Ejercicios'),
    Tab(icon: Icon(Icons.menu_book_sharp), text: 'Informate'),
    Tab(icon: Icon(Icons.health_and_safety), text: 'Ayuda'),
    Tab(icon: Icon(Icons.person), text: 'Perfil'),
  ];

  @override
  void initState(){
    super.initState();
    _tabController = TabController(
      // length: _kTabs.length,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: TabBarView(
  //       controller: _tabController,
  //       children: _kTabPages,
  //     ),
  //     bottomNavigationBar: Material(
  //       color: Colors.blueAccent,
  //       child: TabBar(
  //         tabs: _kTabs,
  //         controller: _tabController,
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(hexColor('#d3cab8')),
  //     body: BlocBuilder<AuthCubit,AuthState>(
  //       buildWhen: (previous, current)=> current is AuthSignedIn,
  //       builder: (_,state){
  //         final authUser = (state as AuthSignedIn).user;
  //         return TabBarView(
  //           controller: _tabController,
  //           // children: _kTabPages,
  //           children: <Widget>[
  //             ejercicios(),
  //             tarjetas(),
  //             ayudad(),
  //             _tabUser(authUser),
  //           ],
  //         );
  //       }
  //     ),
  //     bottomNavigationBar: Material(
  //       color: Color(hexColor('#9C8F9C')),
  //       child: TabBar(
  //         tabs: _kTabs,
  //         controller: _tabController,
  //       ),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('#d3cab8')),
      body: TabBarView(
            controller: _tabController,
            // children: _kTabPages,
            children: <Widget>[
              ejercicios(context),
              tarjetas(),
              ayudad(),
              userHP()
              // paginaUser(context)
            ],
          ),
      bottomNavigationBar: Material(
        color: Color(hexColor('#9C8F9C')),
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }

  

  //TODO: AGREGAR LA PAGINA DE USUSARIO
  // Widget _tabUser(authUser){
  //   return Center(
  //     child: Padding(
  //       padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
  //       child: Column(
  //         children: [
  //           Text('user: ${authUser.uid}'),
  //           SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: ()=>context.read<AuthCubit>().signOut(),
  //             child: Text('Cerrar sesion')
  //           ),
  //           Text('En esta pagina se mostrata la informacion del usuario y podra modificarla'),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
