import 'package:flutter/material.dart';
import 'package:flutter_challange_list_project/core/ui/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum SampleItem {itemOne, itemTwo, itemThree,}


class HomeListTile extends ConsumerStatefulWidget {

  //final UserModel employee;
  //final EmployeeUserModel? test;//

  const HomeListTile({
    super.key,
    //required this.employee,
    //this.test,//
  });

  @override
  ConsumerState<HomeListTile> createState() => _HomeListTileState();
}

class _HomeListTileState extends ConsumerState<HomeListTile> {

// @override
// void initState() {
//   imageCache.clear();
//   imageCache.clearLiveImages();
//   super.initState();
  
// }
  @override
  Widget build(BuildContext context) {
    // final homeState = ref.watch(homeAdmVmProvider);
    // final me = ref.watch(getMeProvider);

    return Container(
      width: 260, //MediaQuery.of(context).size.width*0.5,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.colorGreen, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_2_outlined, 
                          size: 25, 
                          color: AppColors.colorGreen,
                        ),
                      )
                      // FutureBuilder(
                      //   future: FirebaseStorage.instance
                      //       .ref("${widget.employee.firebaseUUID}/${widget.employee.profileFileName}.png")
                      //       .getDownloadURL(),
                            
                      //   builder: (context, snapshot) {
                          
                      //     if (snapshot.connectionState == ConnectionState.waiting) {
                      //       return const Center(
                      //         child: CircularProgressIndicator()
                      //       );
                      //     } else if(snapshot.data == null){
                      //       print(' list item');
                      //       return const CircleAvatar(
                      //         radius: 15,
                      //         backgroundColor: Colors.white,
                      //         child: Icon(
                      //           Icons.person_2_outlined, 
                      //           size: 25, 
                      //           color: AppColors.colorGreen,
                      //         ),
                      //       );
                      //     }
                      //     else{
                      //       //return Image.network(snapshot.data!);
                      //       return CircleAvatar(
                      //         radius: 15,
                      //         backgroundImage: NetworkImage(snapshot.data!),
                      //       );
                      //     }
                          
                      //   },
                        
                      // ),
                      
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        'Nome',
                        overflow: TextOverflow.ellipsis,
                        //maxLines: 2,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    PopupMenuButton<SampleItem>(
                      color: Colors.white,
                      enableFeedback: true,
                      surfaceTintColor: Colors.white,
                      padding: EdgeInsets.zero,
                      position: PopupMenuPosition.under,
                      icon: const Icon(Icons.more_vert, color: AppColors.colorGreen),
                      //initialValue: selectedMenu,

                      // // Callback that sets the selected popup menu item.
                      // onSelected: (SampleItem item) {
                      //   setState(() {
                      //     selectedMenu = item;
                          
                      //   });
                      // },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: ListTile(
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: () async{
                              Navigator.of(context).pop();
                              await Navigator.of(context).pushNamed('/employeeProfile');
                              //;
                            },
                             leading: const Icon(
                              Icons.person_2_outlined,
                              size: 24,
                              color: AppColors.colorGreen,
                            ),
                            title: const Text(
                              'Ver Perfil',
                              style: TextStyle(color: AppColors.colorGreen, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemTwo,
                          child: ListTile(
                       
                             
                            title: Text(
                              'Editar horários',
                              //'Editar Colaborador',
                              style: TextStyle(color: AppColors.colorGreen, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemThree,
                          child: ListTile(
                            title: Text(
                              'Excluir Colaborador',
                              style: TextStyle(color: AppColors.colorRed, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //  Expanded(
                //    child: Text(
                //      employee.name,
                //      //maxLines: 2,
                //      softWrap: true,
                //      style: const TextStyle(
                //        fontSize: 18,
                //        fontWeight: FontWeight.w500,
                //      ),
                //    ),
                //  ),
                // const SizedBox(
                //    height: 25,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10)
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/schedule');
                      },
                      child: const Text('Fazer Agendamento'),
                    ),
                    const SizedBox(
                       width: 15,
                    ),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30)
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/employee/schedulesEmployee');
                        //context.pushNamed('/employee/schedule', arguments: employee);
                      },
                      child: const Text('Ver Agenda'),
                    ),
                  
                    // const Icon(
                    //   AppIcons.trashIcon,
                    //   size: 25,
                    //   color: AppColors.colorRed,
                    // ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
