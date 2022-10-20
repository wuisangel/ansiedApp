import 'package:ansiedapp/src/app.dart';
import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/repository/implementations/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  final authCubit = AuthCubit(AuthRepository());

  runApp(
    BlocProvider(create: (_) => authCubit..init(),
      child: MyApp.create(),
    )
  );
}