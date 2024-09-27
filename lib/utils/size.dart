import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double textScaleFactor;
  static late double textSize;


  // Singleton instance
  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._internal();

  // Initialize with the BuildContext
  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textScaleFactor =
        MediaQuery.of(context).textScaleFactor; // For text scaling

    textSize = ((MediaQuery.of(context).size.width *1)*
        MediaQuery.of(context).textScaleFactor) ;
  }

  // Utility methods for percentage-based width/height
  static double widthPercentage(double percent) {
    return blockSizeHorizontal * percent;
  }

  static double heightPercentage(double percent) {
    return blockSizeVertical * percent;
  }

  // Utility for font scaling
  static double scaledFontSize(double fontSize) {
    return fontSize * textScaleFactor;
  }
}
