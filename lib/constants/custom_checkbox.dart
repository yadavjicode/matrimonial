import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomCheckbox({required this.value, required this.onChanged});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: (bool? value) {
        widget.onChanged(value!);
      },
      checkColor: AppColors.primaryColor, // This is the color of the tick
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors
                .white; // The background color of the checkbox when selected
          }
          return Colors.grey;
          // The default background color when not selected,
        },
      ),
    );
  }
}
