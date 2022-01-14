import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField(
        {Function()? onTap,
required TextEditingController? controller,
        Function(String)? onSubmit,
        String? Function(String?)? validator,
        Widget? label,
        Widget? prefix,
        Widget? suffix}) =>
    TextFormField(
      controller: controller,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      validator: validator,
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );

Widget myButton({required Function() onPressed, Color color = Colors.green , Widget ? widget ,double? width  , double? height}) =>
    MaterialButton(
      onPressed: onPressed,
      color: color,
      child: widget,
      minWidth: width,
      height: height,
    );
void jumpTo({required Widget widget ,context}){
  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>widget));
}
void jumpAndFinishTo({required Widget widget ,context}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>widget));
}
void popTo({required BuildContext context}){
  Navigator.of(context).pop();
}
