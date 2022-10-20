import 'dart:io';

import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/bloc/my_user_cubit.dart';
import 'package:ansiedapp/src/model/user.dart';
import 'package:ansiedapp/src/repository/implementations/my_user_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenDos extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
      child: HomeScreenDos(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => context.read<AuthCubit>().signOut(),
          )
        ],
      ),
      body: userHP(),
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
    }else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                if (widget.isSaving) CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}