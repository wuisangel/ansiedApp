import 'dart:async';
import 'package:ansiedapp/src/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async{
    _authSubscription = _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  Future<void> reset()async=>emit(AuthInitialState());

  void _authStateChanged(AuthUser? user) =>
    user == null ? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

  Future<void> signInAnonymously() => _signIn(_authRepository.signInAnonymously());
  Future<void> signInWithGoogle() => _signIn(_authRepository.signInWithGoogle());
  Future<void> signInWithFacebook() => _signIn(_authRepository.signInWithFacebook());
  Future<void> createUserWithEmailAndPassword(String email, String password) =>
    _signIn(_authRepository.createUserWithEmailAndPassword(email, password));
  Future<void> signInUserWithEmailAndPassword(String email, String password) =>
    _signIn(_authRepository.signInUserWithEmailAndPassword(email, password));

  

  Future<void> _signIn(Future<AuthUser?> auxUser) async{
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null){
        emit(AuthError("Error Desconocido. Intente mas tarde"));
      }else{
        emit(AuthSignedIn(user));
      }
    } catch (e) {
      // emit(AuthError('Error: ${e.toString()}'));
      // print(e.hashCode);
      switch(e.hashCode){
        case 360587416:
          emit(AuthError('El formato de email es invalido'));
          break;
        case 505284406:
          emit(AuthError('El email no se encuentra registrado'));
          break;
        case 185768934:
          emit(AuthError('Contraseña incorrecta. Intente de nuevo'));
          break;
        default:
          emit(AuthError('Error inesperado'));
      }
    }
  }

  Future<void> signOut()async{
    await _authRepository.signOut();
    emit(AuthSignedOut());
  }

  @override
  Future<void> close(){
    _authSubscription.cancel();
    return super.close();
  }
}


abstract class AuthState extends Equatable{
  
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState{

}

class AuthSignedOut extends AuthState{
  
}

class AuthError extends AuthState{
 final String message; 

  AuthError(this.message);
  

  @override
  List<Object?> get props => [message];
}

class AuthSigningIn extends AuthState{

}

class AuthSignedIn extends AuthState{
  final AuthUser user;

  AuthSignedIn(this.user);

  @override
  List<Object?> get props => [user];
}