import 'package:flutter/material.dart';

class DropDonwButtonCustom extends StatefulWidget {
  final String label;
  final List<String> items;

  DropDonwButtonCustom({required this.label, required this.items});

  @override
  _DropDonwButtonCustomState createState() => _DropDonwButtonCustomState();
}

class _DropDonwButtonCustomState extends State<DropDonwButtonCustom> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => setState(() => selectedValue = value),
        items: widget.items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
      ),
    );
  }
}
