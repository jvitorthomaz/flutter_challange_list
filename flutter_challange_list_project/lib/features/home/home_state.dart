import 'package:flutter_challange_list_project/models/motel_model.dart';

enum HomeStateStatus {
  loaded, 
  error 
}

class HomeState {
  final HomeStateStatus status;
  final List<MotelModel> employees;

    HomeState({
    required this.status,
    required this.employees,
    //required this.modelEmployees,//
  });

  HomeState copyWith({
    HomeStateStatus? status,
    List<MotelModel>? employees,    
  }) {
    return HomeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
    );
  }
}