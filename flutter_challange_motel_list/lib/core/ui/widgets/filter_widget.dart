import 'package:flutter/material.dart';

class FilterRow extends StatefulWidget {
  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  final ScrollController _scrollController = ScrollController();

  final List<String> filters = [
    "com desconto",
    "disponíveis",
    "hidro",
    "piscina"
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: false,
      trackVisibility: false,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: FilterButton(
                icon: Icons.tune,
                label: "filtros",
              ),
            ),
            ...filters.map((text) => FilterButton(label: text)).toList(),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final IconData? icon;

  const FilterButton({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: Colors.grey.shade300),
          foregroundColor: Colors.black,
        ),
        onPressed: () {},
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16),
              SizedBox(width: 5),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}
