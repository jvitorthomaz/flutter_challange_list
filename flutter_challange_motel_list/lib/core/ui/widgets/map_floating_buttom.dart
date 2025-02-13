import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';

class MapFloatingButtom extends StatelessWidget {
  const MapFloatingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1),
              ], 
              //border: Border.all()
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
              child: InkWell(
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Icon(
                          Icons.map,
                          color: AppColors.colorRed,
                          size: 20,
                        ),
                       
                    ),
                    Text(
                      'mapa',
                      style: TextStyle(color: AppColors.colorRed),
                    )
                  ],
                ),
                onTap: () {
                  
                },
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}