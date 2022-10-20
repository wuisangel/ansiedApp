import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:ansiedapp/src/navigation/routes.dart';
import 'package:ansiedapp/src/ui/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Widget create(){
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state){
        if(state is AuthSignedOut){
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
        }else if(state is AuthSignedIn){
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.advertencia, (r) => false);
        }
      },
      child: MyApp(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'AnsiedAPP',
      onGenerateRoute: Routes.routes,
    );
  }
}