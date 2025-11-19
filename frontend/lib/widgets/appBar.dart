import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';

AppBar customAppBar() {
  return AppBar(
    title: const Text('Django Todo'),
    elevation: 10,
    // backgroundColor: const Color(0xFF001133),c
    backgroundColor: darkBlue,
  );
}
