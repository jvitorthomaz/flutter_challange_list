import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_challange_list_project/core/ui/constants.dart';
import 'package:flutter_challange_list_project/core/ui/drawer/drawer.dart';
import 'package:flutter_challange_list_project/features/home/widgets/home_list_tile.dart';
import 'package:flutter_challange_list_project/features/widgets/home_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// TODO - padding: const EdgeInsets.fromLTRB(10, 10, 10, 100),
class HomeAdmPage extends ConsumerWidget {

  const HomeAdmPage({ super.key });

   @override
   Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeVmProvider);
    // final clinicInfo = ref.watch(getAdmPlaceProvider);
    // final myInfo = ref.watch(getMeProvider);


    return SafeArea(
      child: Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: const Text('Área de Trabalho', 
            style: TextStyle(color: Colors.white),
          ), 
          backgroundColor: AppColors.colorGreen,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     ref.read(homeAdmVmProvider.notifier).logout();
            //   },
            //   icon: const Icon(
            //     AppIcons.exitAppIcon,
            //     color: Colors.white,
            //     size: 30,
            //   ),
            // )
          ],
        ),
        backgroundColor: Colors.white,
        
        // floatingActionButton: FloatingActionButton(
        //   shape: const CircleBorder(),
        //   backgroundColor: AppColors.colorGreen,
        //   onPressed: () async {
        //     await Navigator.of(context).pushNamed('/employee/registerEmployee');

        //   },
          
        //   child: const CircleAvatar(
        //     backgroundColor: Colors.white,
        //     maxRadius: 16,
        //     child: Icon(
        //       AppIcons.addNewEmplyeeeIcon,
        //       color: AppColors.colorGreen,
        //     ),
        //   ),
        // ),

        // body: CustomScrollView(
        //   slivers: [
        //     SliverToBoxAdapter(
        //       child: HomeHeader(),
        //     ),
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) => HomeListEmployeeTile(),
        //         childCount: 20
        //       )
        //     )
            
        //   ],
        // )
        body: homeState.when(
          data: (HomeState data) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: 
              // (data.employees.isEmpty)
              // ? const Center(
              //     child: Text(
              //       "Sua Clínica ainda não possui colaboradores cadastrados",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   )
              // : 
              RefreshIndicator(
                onRefresh: () async{
                  // const AppLoader();
                  // Future.delayed(Duration(seconds: 1));
                  // return ref.invalidate(homeAdmVmProvider);
                  Navigator.of(context).pushNamed('/home/admUser');
                  

                },
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: HomeHeader(),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const HomeListTile(
                          //employee: data.employees[index],
                          //PASSAR INFO PROFILE PHOTO AQUI
                          //test:  data.modelEmployees[index],
                        ),
                        childCount: data.employees.length,
                      )
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            log(
              'Erro ao carregar colaboradores',
              error: error, 
              stackTrace: stackTrace
            );
            
            return const Center(
              child: Text('Erro ao carregar pagina '),
            );
          },
          
        ),
      //   bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         AppIcons.addNewEmplyeeeIcon,
      //         color: AppColors.colorGreen,
      //       ),
      //       label: 'Adicionar Colaborador',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         AppIcons.addNewEmplyeeeIcon,
      //         color: AppColors.colorGreen,
      //       ),
      //       label: 'Adicionar Colaborador',
      //     ),
         
      //   ],
      //   // currentIndex: _selectedIndex,
      //   // selectedItemColor: Colors.red[800],
      //   // onTap: _onItemTapped,
      // ),
      ),
      
    );
  }
}
