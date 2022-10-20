import 'package:ansiedapp/src/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class EmailCreate extends StatefulWidget{
  
  static Widget create(BuildContext context) => EmailCreate();

  @override
  State<StatefulWidget> createState() => _EmailCreateState();
}

class _EmailCreateState extends State<EmailCreate>{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final _estiloT = new TextStyle(
    fontSize: 18.0,
    fontStyle: FontStyle.normal,
    color: Colors.white);
  final _estiloTH = new TextStyle(
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    color: Colors.white);

  String? emailValidator(String? value){
    return (value == null || value.isEmpty) ? 'Este campo es requerido' : null;
  }

  String? passwordValidator(String? value){
    if(value == null || value.isEmpty) return 'Este campo es requerido';
    if(value.length < 6) return 'El password debe ser de mas de 6 caracteres';
    if(_passwordController.text!=_repeatPasswordController.text)
      return 'Las password no coinciden';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Crea una cuenta'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      extendBody: true,
      // backgroundColor: Colors.blueAccent,
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (_,state){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login/bg_login.jpg'),
                fit: BoxFit.cover,
                // centerSlice: Rect.zero, 
                // matchTextDirection: false,
              ),

            ),
            // clipBehavior: Clip.hardEdge,
            child: Form(
              key: _formKey,  
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                    children: [
                      if(state is AuthSigningIn)
                        Center(child: CircularProgressIndicator(semanticsLabel: 'Iniciando Sesion',)),
                      SizedBox(height: 80),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email, size: 30.0, ),
                            labelText: 'Email',
                            labelStyle: _estiloT,
                            // focusColor: Colors.white,
                          ),
                          validator: emailValidator,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key_outlined, size: 30.0),
                            labelText: 'Contraseña',
                            labelStyle: _estiloT,
                            helperText: 'La contraseña debe ser mayor a 6 caracteres',
                            helperStyle: _estiloTH,
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: _repeatPasswordController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key_outlined, size: 30.0),
                            labelText: 'Confirmar Contraseña',
                            labelStyle: _estiloT,
                            helperText: 'Favor de repetir la contraseña',
                            helperStyle: _estiloTH,
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                      ),  
                      SizedBox(height: 10.0),
                      Center(
                        child: ElevatedButton(
                          child: Text('Crear Cuenta'),
                          onPressed: (){
                            if(_formKey.currentState?.validate()==true){
                              context.read<AuthCubit>().createUserWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,);
                            }
                          },
                          style: ButtonStyle(
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      if(state is AuthError)
                        Text(state.message, style: TextStyle(color: Colors.red, fontSize: 24.0)),
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
