import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_challange_list_project/core/exceptions/repository_exception.dart';
import 'package:flutter_challange_list_project/core/functionalPrograming/either.dart';
import 'package:flutter_challange_list_project/core/restClient/rest_client.dart';
import 'package:flutter_challange_list_project/models/motel_model.dart';
import 'package:flutter_challange_list_project/repositories/motel_repository.dart';

class MotelRepositoryImpl implements MotelRespository {
  final RestClient restClient;


  MotelRepositoryImpl({
    required this.restClient
  });
  
  @override
  Future<Either<RepositoryException, List<MotelModel>>> getEmployees(int placeId) {
    // TODO: implement getEmployees
    throw UnimplementedError();
  }
    // String pathService = FirebaseAuth.instance.currentUser!.uid;
    // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //@override
  // Future<Either<AuthException, String>> login(String email, String password) async{
  //   try {

  //     final preferences = await SharedPreferences.getInstance();
  //     await preferences.setString('loggedUserEmail', email);
  //     await preferences.setString('loggedUserPassword', password);

  //     final credential = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email, 
  //       password: password
  //     );

  //     final Response(:data) = await restClient.unAuth.post('/auth', data: {
  //       'email': email,
  //       'password': password,
  //     });
      
  //     return Success(data['access_token']);

  //   } on DioException catch (e, s) {

  //     if (e.response != null) {
  //       final Response(:statusCode) = e.response!;

  //       if (statusCode == HttpStatus.forbidden) {
  //         log('Login ou senha inválidos', error: e, stackTrace: s);
  //         return Failure(AuthUnauthorizedException());

  //       }
  //     }

  //     log('Erro ao Realizar login', error: e, stackTrace: s);
  //     return Failure(AuthError(message: 'Erro ao realizar login'));
      
  //   }
  //   on FirebaseAuthException catch (e) {

  //     switch (e.code) {
  //       case "user-not-found":
  //       return Failure(AuthError(message: 'O e-mail não está cadastrado.'));
          
  //       case "wrong-password":
  //       return Failure(AuthError(message: 'Senha incorreta.'));
  //     }
  //     return Failure(AuthError(message: e.code));

  //   }
  // }



  // @override
  // Future<Either<RepositoryException, Nil>> registerUserAdm(
  //   ({String email, String name, String password}) userData
  // ) async{
  //   try {
  //     UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: userData.email,
  //       password: userData.password,
  //     );
  //     final preferences = await SharedPreferences.getInstance();
  //     await preferences.setString('loggedUserEmail', userData.email);
  //     await preferences.setString('loggedUserPassword', userData.password);
      
  //     await userCredential.user!.updateDisplayName(userData.name);

  //     await restClient.unAuth.post(
  //       '/users',
  //       data: {
  //         'name': userData.name,
  //         'email': userData.email,
  //         'password': userData.password,
  //         'profile': 'ADM'
  //       },
  //     );

  //     return Success(nil);

  //   } on DioException catch (e, s) {
  //     log('Erro ao registrar usuário do tipo administrador', error: e, stackTrace: s);
  //     return Failure(
  //       RepositoryException(
  //         message: 'Erro ao registrar usuário do tipo administrador'
  //       )
  //     );

  //   }
  //   on FirebaseAuthException catch (e) {
      
  //     switch (e.code) {
  //       case "email-already-in-use":
  //       return Failure(
  //         RepositoryException(
  //           message: 'O e-mail já está em uso.'
  //         )
  //       );
  //     }
  //     return Failure(
  //       RepositoryException(
  //         message: 'Erro ao registrar usuário do tipo administrador: ${e.code}'
  //       )
  //     );
  //   }
  // }
  

  // @override
  // Future<Either<RepositoryException, List<MotelModel>>> getEmployees(int placeId) async{
  //   try {
  //     final Response(:List data) = await restClient.auth.get('/users', queryParameters: {'place_id': placeId});

  //     final employees = data.map((e) => EmployeeUserModel.fromMap(e)).toList();

  //     return Success(employees);

  //   } on DioException catch (e, s) {
  //     log('Erro ao buscar colaboradores', error: e, stackTrace: s);

  //     return Failure(
  //       RepositoryException(message: 'Erro ao buscar colaboradores')
  //     );

  //   } on ArgumentError catch (e, s) {

  //     log(
  //       'Erro ao converter colaboradores (Invalid Json)',
  //       error: e, stackTrace: s
  //     );

  //     return Failure(
  //       RepositoryException(
  //         message: 'Erro ao converter colaboradores (Invalid Json)'
  //       )
  //     );
  //   }
  // }
 

  // @override
  // Future<String?> signOut() async {
  //   try {
  //     print('--------------\n Chega aqui \n ------------');
  //     await _firebaseAuth.signOut();
      
  //   } on FirebaseAuthException catch (e) {
  //     return e.code;
  //   }
  //   return '';
  // }
  
  
}
