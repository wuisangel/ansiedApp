import 'package:ansiedapp/src/model/user.dart';
import 'package:ansiedapp/src/provider/firebase_provider.dart';
import 'dart:io';

import 'package:ansiedapp/src/repository/my_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase{
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUSer() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) => provider.saveMyUser(user, image);

}