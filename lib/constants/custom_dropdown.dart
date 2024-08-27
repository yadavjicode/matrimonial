import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'color_constant.dart';
import 'font_constant.dart';

Widget buildDropdown(
  String? title,
  List<String> items,
  Function(String?) onChanged, {
  String? hintText,
  Color borderColor = AppColors.darkgrey,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null && title.isNotEmpty)
        Text(
          title,
          style: FontConstant.styleRegular(fontSize: 15, color: Colors.black),
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
            listItemStyle:
                FontConstant.styleRegular(fontSize: 16, color: Colors.black),
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
            int index =
                items.indexOf(value!); // Get the index of the selected value
            onChanged(
                value, index); // Pass both value and index to the callback
          },
        ),
      ),
    ],
  );
}

Widget buildDropdownWithSearch(
  String? title,
  List<String> items,
  Function(String?) onChanged, {
  String? hintText,
  double? radiusdrop,
  Color borderColor = AppColors.darkgrey,
  String? selectedItem,
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
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSearchBox: true,

            // Enable the search box
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search for $title",
                labelStyle: FontConstant.styleRegular(
                    fontSize: 15, color: AppColors.black),
                hintStyle: FontConstant.styleRegular(
                    fontSize: 15, color: AppColors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors
                          .primaryColor), // Set color for focused state
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey),
                    // Set color for enabled state
                    ),
              ),
            ),

            menuProps: MenuProps(
              backgroundColor: AppColors.primaryLight,
              // Background color of the dropdown menu
            ),
          ),
          items: items,
          selectedItem: selectedItem,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle:
                FontConstant.styleRegular(fontSize: 16, color: Colors.black),
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusdrop ?? 23),
                borderSide: BorderSide(color: borderColor),
              ),
              suffixIconColor: AppColors.darkgrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusdrop ?? 23),
                borderSide: BorderSide(color: borderColor),
              ),
              hintText: hintText ?? '',
              //   labelText: hintText ?? '',
            ),
          ),
          onChanged: onChanged,
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
