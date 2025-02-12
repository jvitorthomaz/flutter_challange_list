import 'package:asyncstate/asyncstate.dart';
import 'package:flutter_challange_list_project/core/functionalPrograming/either.dart';
import 'package:flutter_challange_list_project/features/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:tcc_app/src/core/functionalPrograming/either.dart';
// import 'package:tcc_app/src/core/providers/aplication_providers.dart';
// import 'package:tcc_app/src/features/home/home_adm/home_adm_state.dart';
// import 'package:tcc_app/src/models/place_model.dart';
// import 'package:tcc_app/src/models/users_model.dart';

// part 'home_adm_vm.g.dart';


// @riverpod
// class HomeVm extends _$HomeAdmVm{
//   Future<HomeState> build() async {
    
//     // final repository = ref.read(userRespositoryProvider);
//     // final PlaceModel(id: placeId) = await ref.read(getAdmPlaceProvider.future);
//     // final me = await ref.watch(getMeProvider.future);
    
//     // final motelsListResult = await repository.getEmployees(placeId);

//     // switch(motelsListResult) {
//     //   case Success(value: final employeesData) :
//     //     final employees = <MotelModel>[];
//     //     //final fullModel = <EmployeeUserModel>[];//

//     //     //Usuario adm tbm é colaborador?
//     //     if(me case MotelModel(workDays: _?, workHours: _?)) {
//     //       employees.add(me);
//     //     }
        
//     //     employees.addAll(employeesData);

//     //     return HomeState(
//     //       status: HomeStateStatus.loaded, employees: employees, 
//     //       //modelEmployees: fullModel//
//     //     );

//     //   case Failure(): 
//     //     return HomeState(
//     //       status: HomeStateStatus.loaded, employees: [],
//     //       //modelEmployees: [] //
//     //     );
//     // }

//   }

//   // Future<void> logout() => ref.read(logoutProvider.future).asyncLoader();

//   //   Future<void> deleteUserVm(int idUser) async {
//   //     final asyncLoaderHandler = AsyncLoaderHandler()..start();

//   //     final userRepository = ref.read(userRespositoryProvider);
//   //     final deleteUserResult = await userRepository.deleteUser(idUser);

//   //     // switch (deleteUserResult) {
//   //     //   case Success():
//   //     //     state = state.copyWith(status: SchedulesStateStatus.success);

//   //     //   case Failure():
//   //     //     state = state.copyWith(status: SchedulesStateStatus.error);
          
//   //     // }

//   //     asyncLoaderHandler.close();
//   //   }

//   // //TENTAR COM .WATCH
//   // //Future<void> logout() => ref.watch(logoutProvider.future).asyncLoader();
  
// }

