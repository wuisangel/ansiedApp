import 'dart:io';

import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/bloc/my_user_cubit.dart';
import 'package:ansiedapp/src/model/user.dart';
import 'package:ansiedapp/src/repository/implementations/my_user_repository.dart';
import 'package:ansiedapp/src/ui/cards_page/cards.dart';
import 'package:ansiedapp/src/ui/ejercicios_page/ejercicios.dart';
import 'package:ansiedapp/src/ui/help_page/ayuda.dart';
import 'package:ansiedapp/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget{
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
      child: HomeScreen(),
    );
  }


  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin {
  // static Widget create(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
  //     child: HomeScreen(),
  //   );
  // }


  //!tabsss!!!
  late TabController _tabController;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor('#d3cab8')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page/bg_hpd.PNG'),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Color(0xFF701ebd),
          //     Color(0xFF873bcc),
          //     Color(0xFFfe4a97),
          //     Color(0xFFe17763),
          //     // Color(0xFF68998c),
          //   ]
          // )
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            ejercicios(context),
            tarjetas(),
            ayudad(),
            userHP(),
          ],
        ),
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

  // Widget userHP(){
  //   return BlocBuilder<MyUserCubit, MyUserState>(
  //       builder: (_, state) {
  //         if (state is MyUserReadyState) {
  //           return _MyUserSection(
  //             user: state.user,
  //             pickedImage: state.pickedImage,
  //             isSaving: state.isSaving,
  //           );
  //         }
  //         return Center(child: CircularProgressIndicator());
  //       },
  //     );
  // }

}

Widget userHP(){
    return BlocBuilder<MyUserCubit, MyUserState>(
        builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
  }

class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    _nameController.text = widget.user?.nombre ?? '';
    _lastNameController.text = widget.user?.apellido ?? '';
    _ageController.text = widget.user?.edad.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/images/home_page/ayuda_page.png',
      fit: BoxFit.fill,
    );

    if (widget.pickedImage != null) {
      image = Image.file(
        widget.pickedImage!,
        fit: BoxFit.fill,
      );
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }
    final titulo = TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontFamily: 'SourceSerifPro', color: Colors.white);
    final textS = TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontFamily: 'SourceSansPro', color: Colors.white, fontWeight: FontWeight.bold);


    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/intro_page/1.png', height: 150,),
            SizedBox(height: 15.0),
            Text('BIENVENIDO', style: titulo, textAlign: TextAlign.center),
            Text('Visualiza y modifica tu información', style: textS, textAlign: TextAlign.center),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: () async {
                final pickedImage = await picker.getImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  context.read<MyUserCubit>().setImage(File(pickedImage.path));
                }
              },
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: image,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (_, current) => current is AuthSignedIn,
              builder: (_, state) {
                return Center(
                  child: Text('UID: ${(state as AuthSignedIn).user.uid}'),
                );
              },
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      child: const Text('Guardar'),
                      onPressed: widget.isSaving
                          ? null
                          : () {
                              context.read<MyUserCubit>().saveMyUser(
                                    (context.read<AuthCubit>().state
                                            as AuthSignedIn)
                                        .user
                                        .uid,
                                    _nameController.text,
                                    _lastNameController.text,
                                    int.tryParse(_ageController.text) ?? 0,
                                  );
                            },
                    ),
                    //!cerrar sesion
                    ElevatedButton(
                      child: const Text('Cerrar sesion'),
                      onPressed: () => context.read<AuthCubit>().signOut(),
                    ),
                  ],
                ),
                if (widget.isSaving) CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}