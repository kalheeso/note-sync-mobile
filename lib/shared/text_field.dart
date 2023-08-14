import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final Color? fillColor;
  final int? maxLines;

  const CustomTextField({super.key, this.prefixIcon, this.onChanged, this.hintText, this.fillColor, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(cursorHeight: 16,
    maxLines: maxLines,
      style: TextStyle(color: Color(0xffa3aec1), ),
      cursorColor: Colors.white,
      onChanged: onChanged,
      decoration:  InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xffa3aec1)),
        prefixIcon: prefixIcon != null ? Padding(padding: const EdgeInsets.all(4),
          child: Icon(prefixIcon, color: Colors.white,),) : null,
        fillColor: fillColor ?? Color(0xff1c1c1e),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
        focusColor: null,
        hoverColor: null
      ),
    );
  }
}