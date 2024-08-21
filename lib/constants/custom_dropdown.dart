import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'color_constant.dart';
import 'font_constant.dart';

Widget buildDropdown(
  String? title,
  List<String> items,
  Function(String?) onChanged, {
  String? hintText,
  Color borderColor = Colors.black,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null && title.isNotEmpty)
        Text(
          title,
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomDropdown(
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(23),
            closedBorder: Border.all(color: borderColor),
            expandedFillColor: AppColors.primaryLight,
            listItemDecoration: const ListItemDecoration(
              splashColor: Colors.white,
            ),
            listItemStyle: const TextStyle(color: Colors.black),
          ),
          hintText: hintText ?? '',
          items: items,
          
          onChanged: onChanged,
          
        ),
      ),
    ],
  );
}

Widget buildDropdown2(
  String? title,
  List<String> items,

  Function(String?) onChanged, {
  String? hintText,
  Color borderColor = Colors.black,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null && title.isNotEmpty)
        Text(
          title,
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomDropdown(
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(5),
            closedBorder: Border.all(color: borderColor),
            expandedFillColor: AppColors.primaryLight,
            listItemDecoration: const ListItemDecoration(
              splashColor: Colors.white,
            ),
            listItemStyle: const TextStyle(color: Colors.black),
          ),
          hintText: hintText ?? '',
          items: items,
          onChanged: onChanged,
        ),
      ),
    ],
  );
}

Widget buildDropdown3(
  String? title,
  List<String> items,
  Function(String?, int) onChanged, // Function to pass both value and index
  {
  String? hintText,
  Color borderColor = Colors.black,
  int? initialIndex, // Optional parameter to pass the initial index
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (initialIndex != null && initialIndex < items.length) {
      onChanged(items[initialIndex], initialIndex); // Set initial value
    }
  });

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null && title.isNotEmpty)
        Text(
          title,
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomDropdowns(
          // No value parameter needed
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(23),
            closedBorder: Border.all(color: borderColor),
            expandedFillColor: AppColors.primaryLight,
            listItemDecoration: const ListItemDecoration(
              splashColor: Colors.white,
            ),
            listItemStyle: const TextStyle(color: Colors.black),
          ),
          hintText: hintText ?? '',
          items: items,
          onChanged: (value) {
            int index = items.indexOf(value!); // Get the index of the selected value
            onChanged(value, index); // Pass both value and index to the callback
          },
        ),
      ),
    ],
  );
}


class CustomDropdowns extends StatelessWidget {
  final List<String> items;
  final String? value; // Add this parameter
  final Function(String?) onChanged;
  final String? hintText;
  final CustomDropdownDecoration decoration;

  CustomDropdowns({
    required this.items,
    this.value, // Accept initial value
    required this.onChanged,
    this.hintText,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    // Use the value inside the dropdown logic
    return DropdownButton<String>(
      value: value,
      hint: Text(hintText ?? ''),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}



