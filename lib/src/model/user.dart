import 'package:equatable/equatable.dart';

class MyUser extends Equatable{
  
  final String id;
  final String nombre;
  final String apellido;
  final int edad;

  final String? image;

  MyUser(this.id, this.nombre, this.apellido, this.edad, {this.image});



  @override
  // TODO: implement props
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}){
    return <String, Object?>{
      'id':id,
      'nombre':nombre,
      'apellido':apellido,
      'edad':edad,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
  : id = data['id'] as String,
    nombre = data['nombre'] as String,
    apellido = data['apellido'] as String,
    edad = data['edad'] as int,
    image = data['image'] as String?;
    

}