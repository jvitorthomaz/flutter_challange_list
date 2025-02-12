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
              //border: Border.all()
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: InkWell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: IconButton(
                        icon: const Icon(
                          Icons.map,
                          color: AppColors.colorRed,
                          size: 20,
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                    const Text(
                      'mapa',
                      style: TextStyle(color: AppColors.colorRed),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}