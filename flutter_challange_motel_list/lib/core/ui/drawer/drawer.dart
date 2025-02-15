import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "go fidelidade",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Acumule selinhos e troque por reservas grátis. Vale em todos os motéis e horários!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(icon: LucideIcons.user, text: "login"),
                _buildDrawerItem(icon: LucideIcons.lifeBuoy, text: "ajuda"),
                _buildDrawerItem(icon: LucideIcons.settings, text: "configurações"),
                _buildDrawerItem(icon: LucideIcons.bug, text: "comunicar problema"),
                _buildDrawerItem(icon: LucideIcons.megaphone, text: "tem um motel? faça parte"),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              "versão 2.0.087",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          onTap: () {},
        ),
        Divider(height: 1, thickness: 0.5, color: Colors.grey.shade300),
      ],
    );
  }
}
