import 'package:ansiedapp/src/model/user.dart';
import 'dart:io';

abstract class MyUserRepositoryBase{
  Future<MyUser?> getMyUSer();

  Future<void> saveMyUser(MyUser user, File? image);
}