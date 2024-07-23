import 'package:flutter/material.dart';

class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    }else if (value == 'Green') {
      return Colors.green;
    }else if (value == 'Yellow') {
      return Colors.yellow;
    }else if (value == 'Orange') {
      return Colors.orange;
    }else if (value == 'Blue') {
      return Colors.blue;
    }else if (value == 'Purple') {
      return Colors.purple;
    }else if (value == 'Pink') {
      return Colors.pink;
    }else if (value == 'Black') {
      return Colors.black;
    }else if (value == 'Teal') {
      return Colors.teal;
    }else if (value == 'Indigo') {
      return Colors.indigo;
    }else if (value == 'Grey') {
      return Colors.grey;
    }
    return null;
  }
}
