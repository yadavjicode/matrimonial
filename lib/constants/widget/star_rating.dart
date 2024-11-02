import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // Number of yellow stars
  final int maxRating; // Total number of stars (e.g., 5)

  const StarRating({
    Key? key,
    this.rating = 3, // Default to 3 stars for example
    this.maxRating = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating
              ? Icons.star
              : Icons.star_border, // Filled or outlined star
          color: index < rating
              ? AppColors.yellow 
              : Colors.grey, // Yellow for filled, grey for empty
        );
      }),
    );
  }
}
