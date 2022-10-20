import 'dart:io';

import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class EmailLogin extends StatefulWidget{
  
  static Widget create(BuildContext context) => EmailLogin();

  @override
  State<StatefulWidget> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin>{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _estiloT = new TextStyle(
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    color: Colors.white);

  final _estiloTH = new TextStyle(
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    color: Colors.white);


  String? validator(String? value){
    return (value == null || value.isEmpty) ? 'Este campo es requerido' : null;
  }

  String? passwordValidator(String? value){
    if(value == null || value.isEmpty) return 'Este campo es requerido';
    if(value.length < 6) return 'El password debe ser de mas de 6 caracteres';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Inicia sesión con E-mail'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      // extendBody: true,
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (_,state){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login/bg_login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,  
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    if(state is AuthSigningIn)
                      Center(child: CircularProgressIndicator(semanticsLabel: 'Iniciando Sesion')),
                      
                    SizedBox(height: 80.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email, size: 30.0),
                        labelText: 'Email',
                        labelStyle: _estiloT,
                       ),
                       validator: validator,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key_outlined, size: 30.0),
                        labelText: 'Contraseña',
                        labelStyle: _estiloT,
                      ),
                      obscureText: true,
                      validator: validator,
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        child: Text('Iniciar sesión'),
                        onPressed: (){
                          int _x=0;
                          if(_formKey.currentState?.validate()==true){
                            context.read<AuthCubit>().signInUserWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,);
                          }
                        },
                        style: ButtonStyle(
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    if(state is AuthError)
                      Text(state.message, style: TextStyle(color: Colors.red, fontSize: 20.0), textAlign: TextAlign.center),                  
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }

}
