import 'package:equatable/equatable.dart';
//import "package:firebase_auth/firebase_auth.dart";
import 'package:equatable/equatable.dart';

class AuthUser extends Equatable{
  final String uid;
  final String? email;

  AuthUser(this.uid, this.email);
  
  @override
  List<Object?> get props => [uid];
}

abstract class AuthRepositoryBase{
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> signInAnonymously();

  Future<AuthUser?> signInWithGoogle();

  Future<AuthUser?> signInWithFacebook();

  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password);
  Future<AuthUser?> signInUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();


}