
import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';
import 'package:flutter_challange_motel_list/core/ui/drawer/drawer.dart';

class CustomAppBar extends StatefulWidget {
  
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedToggle = 0;
  String _selectedLocation = "Minha Localização";


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
    return Container(
      
      decoration: const BoxDecoration(
        color: AppColors.colorRed,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),

      ),
      
      
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                const Spacer(),

                CustomToggleButton(),

                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
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
          ),
        ],
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
    double width = MediaQuery.of(context).size.width * 0.7;
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
            duration: Duration(milliseconds: 300),
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
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flash_on, color: _leftTextColor, size: 18),
                    SizedBox(width: 5),
                    Text("Ir Agora",
                        style: TextStyle(
                            color: _leftTextColor,
                            fontWeight: FontWeight.bold)),
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
                    Icon(Icons.calendar_today, color: _rightTextColor, size: 18),
                    SizedBox(width: 5),
                    Text("Ir Outro Dia",
                        style: TextStyle(
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
