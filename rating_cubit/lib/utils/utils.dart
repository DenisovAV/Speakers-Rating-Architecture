import 'package:flutter/material.dart';

class Utils {
  static Icon? getRatingIcon(int rating) {
    switch (rating) {
      case 1:
        return Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
        );
      case 2:
        return Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.redAccent,
        );
      case 3:
        return Icon(
          Icons.sentiment_neutral,
          color: Colors.amber,
        );
      case 4:
        return Icon(
          Icons.sentiment_satisfied,
          color: Colors.lightGreen,
        );
      case 5:
        return Icon(
          Icons.sentiment_very_satisfied,
          color: Colors.green,
        );
    }
    return null;
  }
}
