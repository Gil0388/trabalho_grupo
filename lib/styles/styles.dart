// COLORS
import 'package:flutter/material.dart';

const Color pink = Color.fromRGBO(169, 1, 247, 1);
const Color purple = Color.fromRGBO(49, 1, 155, 1);
const Color blue = Color.fromRGBO(49, 1, 185, 1);
const Color yellow = Color.fromRGBO(255, 214, 0, 1);
const Color white = Colors.white;

const Color yellowLight = Color.fromRGBO(255, 242, 204, 1);
const Color greenLight = Color.fromRGBO(199, 255, 203, 1);
const Color pinkLight = Color.fromRGBO(255, 217, 240, 1);
const Color purpleLight = Color.fromRGBO(232, 197, 255, 1);
const Color blueLight = Color.fromRGBO(202, 251, 255, 1);

// TEXTFORMFIELDS
InputDecoration textFormFieldDecorator(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: white,
    hintText: hintText,
    hintStyle: const TextStyle(color: purple, fontSize: 14),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  );
}

// BUTTONS
ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(blue),
  padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
  visualDensity: VisualDensity.compact,
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10))),
);
