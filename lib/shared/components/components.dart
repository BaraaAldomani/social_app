import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField(
        {required Function() onTap,
        String? Function(String?)? validator,
        Widget? label,
        Widget? prefix,
        Widget? suffix}) =>
    TextFormField(
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
