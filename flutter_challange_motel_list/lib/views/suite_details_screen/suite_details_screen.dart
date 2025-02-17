import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// TELA AINDA ESTA ESTÁTICA
//

class SuiteDetailsScreen extends StatefulWidget {
  @override
  State<SuiteDetailsScreen> createState() => _SuiteDetailsScreenState();
}

class _SuiteDetailsScreenState extends State<SuiteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.keyboard_arrow_down, 
                  size: 30, 
                  color: Colors.grey[700]
                ),
              ),
              onTap: (){
                Navigator.pop(context);

              },
            ),

            const SizedBox(height: 100),

            Center(
              child: Text(
                "Suíte Marselha s/ garagem privativa",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.grey[800]),
              ),
            ),

            const SizedBox(height: 30),

            _sectionTitle("principais itens"),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _iconItem(FontAwesomeIcons.chargingStation, "frigobar"),
                const SizedBox(width: 30),
                _iconItem(FontAwesomeIcons.snowflake, "ar-condicionado"),
              ],
            ),

            const SizedBox(height: 20),

            _iconItem(FontAwesomeIcons.wifi, "internet wi-fi"),

            const SizedBox(height: 60),

            _sectionTitle("tem também"),

            const SizedBox(height: 10),

            Text(
              "TV LCD, som ambiente, luz negra, ducha, cine privê, saleta para refeições, canais eróticos, frigobar, ar-condicionado, Wi-Fi",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[400], thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey[400], thickness: 1)),
      ],
    );
  }

  Widget _iconItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width:10),
        Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
      ],
    );
  }
}
