import 'package:flutter/material.dart';

createFooterButtons(String text, onTabCallback) {
  return GestureDetector(
    child: Text(text),
    onTap: onTabCallback,
  );
}
