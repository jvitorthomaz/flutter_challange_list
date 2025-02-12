import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerApp extends ConsumerStatefulWidget {
  final String? userName;
  final String? useEmail;

  const DrawerApp({ super.key, this.userName, this.useEmail});

  @override
  ConsumerState<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends ConsumerState<DrawerApp> {




  @override
  Widget build(BuildContext context) {
    // final clinicInfo = ref.watch(getAdmPlaceProvider);
    // final myInfo = ref.watch(getMeProvider);

    return Drawer(
      child: Column(
            children: [
              // UserAccountsDrawerHeader(
              //   currentAccountPicture: FirebaseAuth.instance.currentUser!.photoURL != null ?
              //   CircleAvatar(
              //     backgroundImage: (FirebaseAuth.instance.currentUser!.photoURL != null)
              //         ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)
              //         : null,
              //   )
              //   :
              //   const CircleAvatar(
              //     radius: 20,
              //     backgroundColor: Colors.white,
              //     child: Icon(Icons.person, size: 50, color: AppColors.colorGreen,),
              //   ),
              //   decoration: const BoxDecoration(
              //       color: AppColors.colorGreen
              //   ),
              //   accountName: Text(
              //     myInfoData.name
              //   ),
              //   accountEmail: Text(myInfoData.email),
                
              //   //arrowColor: Colors.black,
              // ),

              const ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                title: Text("Perfil"),
           
              ),

              ListTile(
                leading: const Icon(
                  Icons.work,
                  color: Colors.green,
                ),
                title: const Text("Clínica"),
                onTap: () async{
                  await Navigator.of(context).pushNamed('/userClinicProfile',);
                },
              ),

              const ListTile(
                leading: Icon(
                  Icons.history,
                  color: Colors.green,
                ),
                title: Text("Histórico de agendamentos"),
         
              ),

              //   ListTile(
              //   leading: const Icon(
              //     // Icons.work_outline,
              //     Icons.edit,
              //     color: Colors.green,
              //   ),
              //   title: const Text("Editar Clínica"),
              //   onTap: () async{
              //     await Navigator.of(context).pushNamed('/updateClinic', arguments: clinicInfo);
              //   },
              // ),

              ListTile(
                leading: const Icon(
                  Icons.key,
                  color: Colors.green,
                ),
                title: const Text("Alterar senha"),
                onTap: () async{
                  //Navigator.of(context).pop();
                  await Navigator.of(context).pushNamed('/updatePassword');
                },
              ),

              // const SizedBox(
              //   height: 200,
              // ),

              const SizedBox(
                 height: 50,
              ),
            ],
          )
  
      
    );
  }

}