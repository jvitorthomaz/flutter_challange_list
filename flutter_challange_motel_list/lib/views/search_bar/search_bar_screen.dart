import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(FocusNode()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), 
        child: AppBar(
          backgroundColor: Colors.red, 
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.keyboard_arrow_down, 
                          color: AppColors.colorWhite,
                          size: 22,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.redAccent,
                            hintText: "motel, bairro ou cidade",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          ),
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          cursorColor: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(width: 10),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "cancelar",
                          style: TextStyle(color: Color.fromARGB(255, 246, 209, 209), fontSize: 16, ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(), 
    );
  }
}
