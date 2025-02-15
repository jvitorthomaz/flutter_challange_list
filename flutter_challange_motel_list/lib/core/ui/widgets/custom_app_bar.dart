
import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';
import 'package:flutter_challange_motel_list/core/ui/drawer/drawer.dart';
import 'package:flutter_challange_motel_list/views/search_bar/search_bar_screen.dart';

class CustomAppBar extends StatefulWidget {
  
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: 100,
      elevation: 0,
      backgroundColor: AppColors.colorRed,
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomToggleButton(),
                const CustomDropdownButton(),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 22,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchScreen()
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  int _selectedToggle = 0;
  String _selectedLocation = "Minha Localização";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.colorRedLight,
          value: _selectedLocation,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.colorWhite),
          onChanged: (String? newValue) {
            setState(() {
              _selectedLocation = newValue!;
            });
          },
          items: <String>["Minha Localização", "Outra Localização"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: AppColors.colorWhite)),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  double _toggleXAlign = -1;
  Color _leftTextColor = Colors.black;
  Color _rightTextColor = Colors.white;

  void _toggle(int index) {
    setState(() {
      if (index == 0) {
        _toggleXAlign = -1;
        _leftTextColor = Colors.black;
        _rightTextColor = Colors.white;
      } else {
        _toggleXAlign = 1;
        _leftTextColor = Colors.white;
        _rightTextColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = 40;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.red, 
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.red),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          GestureDetector(
            onTap: () => _toggle(0),
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: _leftTextColor, size: 12),
                    const SizedBox(width: 5),
                    Text("Ir Agora",
                        style: TextStyle(
                          fontSize: 12,
                            color: _leftTextColor,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _toggle(1),
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today, color: _rightTextColor, size: 12),
                    SizedBox(width: 5),
                    Text("Ir Outro Dia",
                        style: TextStyle(
                            fontSize: 12,
                            color: _rightTextColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
