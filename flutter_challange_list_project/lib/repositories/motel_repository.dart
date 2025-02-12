import 'package:flutter_challange_list_project/core/exceptions/repository_exception.dart';
import 'package:flutter_challange_list_project/core/functionalPrograming/either.dart';
import 'package:flutter_challange_list_project/models/motel_model.dart';

abstract interface class MotelRespository {

  Future<Either<RepositoryException, List<MotelModel>>> getEmployees(
    int placeId
  );

}