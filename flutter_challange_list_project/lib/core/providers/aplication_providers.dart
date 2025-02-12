
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// part 'aplication_providers.g.dart';

// @Riverpod(keepAlive: true)
// RestClient restClient(RestClientRef ref) => RestClient();


// @Riverpod(keepAlive: true)
// UserRespository userRespository(UserRespositoryRef ref) => 
//   UserRepositoryImpl(restClient: ref.read(restClientProvider));


// @Riverpod(keepAlive: true)
// UserLoginService userLoginService(UserLoginServiceRef ref) => 
//   UserLoginServiceImpl(userRespository: ref.read(userRespositoryProvider));


// @Riverpod(keepAlive: true)
// Future<UserModel> getMe(GetMeRef ref) async{
//   final result = await ref.watch(userRespositoryProvider).me();

//   return switch (result) {
//     Success(value: final userModel) => userModel,
//     Failure(:final exception) => throw exception,
//   };
// }


// @Riverpod(keepAlive: true)
// PlacesRepository placesRepository(PlacesRepositoryRef ref) => 
//   PlacesRepositoryImpl(restClient: ref.watch(restClientProvider));


// @Riverpod(keepAlive: true)
// Future<PlaceModel> getAdmPlace(GetAdmPlaceRef ref) async {
//   final userModel = await ref.watch(getMeProvider.future);
//   final placeRepository = ref.watch(placesRepositoryProvider);
//   final result = await placeRepository.getAdmPlace(userModel);

//   return switch (result) {
//     Success(value: final place) => place,
//     Failure(:final exception) => throw exception,
//   };
// }


// @riverpod
// Future<void> logout(LogoutRef ref) async {
//   final preferences = await SharedPreferences.getInstance();
//   preferences.clear();
  
//   await ref.read(userRespositoryProvider).signOut();

//   ref.invalidate(getMeProvider);
//   ref.invalidate(getAdmPlaceProvider);

//   await Future.delayed(const Duration(milliseconds: 500));

//   Navigator.of(AppNavGlobalKey.instance.navKey.currentContext!)
//     .pushNamedAndRemoveUntil('/auth/login', (route) => false);


//   //ou
//   // Navigator.of(AppNavGlobalKey.instance.navKey.currentContext!)
//   //  .pushNamedAndRemoveUntil('/auth/login', (route) => false);

//   // await Future.delayed(const Duration(milliseconds: 500));

//   // ref.invalidate(getMeProvider);
//   // ref.invalidate(getAdmPlaceProvider);
// }

// @riverpod
// SchedulesRepository schedulesRepository(SchedulesRepositoryRef ref) => 
//   SchedulesRepositoryImpl(restClient: ref.read(restClientProvider));

  
