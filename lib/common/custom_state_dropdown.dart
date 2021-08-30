import 'package:flutter/material.dart';

class CustomStateDropdown extends StatelessWidget {
  final String textHint;
  final String errorText;
  final List items;
  final double width;
  final bool isExpanded;
  final String value;
  final Function onChanged;
  final Function onTap;

  CustomStateDropdown(
      {this.isExpanded,
      this.onTap,
      this.width,
      this.textHint,
      this.errorText,
      this.items,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 47,
        width: width,
        child: InputDecorator(
          decoration: InputDecoration(
              errorText: errorText,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              onTap: onTap,
              hint: Text(
                textHint,
                // style: TextStyle(color: Colors.grey.shade400),
              ),
              items: items,
              isExpanded: isExpanded,
              onChanged: onChanged,
              value: value,
            ),
          ),
        ),
      ),
    );
  }
}
