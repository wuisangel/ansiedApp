import 'dart:io';
import 'dart:async';

import 'package:ansiedapp/src/model/user.dart';
import 'package:ansiedapp/src/repository/my_user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyUserCubit extends Cubit<MyUserState>{
  final MyUserRepositoryBase _userRepository;

  File? _pickedImage;
  late MyUser _user;

  MyUserCubit(this._userRepository) : super(MyUserLoadingState());

  void setImage(File? imageFile)async{
    _pickedImage=imageFile;
    emit(MyUserReadyState(_user, _pickedImage));
  }

  Future<void> getMyUser()async{
    emit(MyUserLoadingState());
    _user=(await _userRepository.getMyUSer()) ?? MyUser('','','',0);
    emit(MyUserReadyState(_user, _pickedImage));
  }

  Future<void> saveMyUser(
    String uid,
    String nombre,
    String apellido,
    int edad,
  )async{
    _user = MyUser(uid, nombre, apellido, edad, image: _user.image);
    emit(MyUserReadyState(_user, _pickedImage, isSaving: true));

    await Future.delayed(Duration(seconds: 3));
    await _userRepository.saveMyUser(_user, _pickedImage);
    emit(MyUserReadyState(_user, _pickedImage));
  }
}

abstract class MyUserState extends Equatable{
  @override
  List<Object?> get props=>[];
}

class MyUserLoadingState extends MyUserState{}

class MyUserReadyState extends MyUserState {
  final MyUser user;
  final File? pickedImage;
  final isSaving;

  MyUserReadyState(this.user, this.pickedImage, {this.isSaving = false});

  @override
  List<Object?> get props => [user, pickedImage?.path, isSaving];
}