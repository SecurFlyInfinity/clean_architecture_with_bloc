import 'package:flutter/material.dart';

import '../theme/theme_config.dart';

class SharedWidget{
  static Widget search({TextEditingController? controller,ValueChanged<String>? onChanged}){
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        controller: controller,
        style: ThemeConfig.styles.style14,
        onChanged: onChanged,
        decoration: InputDecoration(
            fillColor: Colors.white60,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            hintText: ThemeConfig.strings.search
        ),
      ),
    );
  }

  static SizedBox width(double size)=>SizedBox(width: size);
  static SizedBox height(double size)=>SizedBox(height: size);

  static snackBar({required BuildContext context, required Widget content, Duration? duration}){
    var snackBar = SnackBar(
      content: content,
      margin: const EdgeInsets.all(20),
      duration: duration??const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<DateTime?> datePicker({required BuildContext context,required DateTime initialDate,DatePickerMode? initialDatePickerMode})async{
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      helpText: "Select Date of Birth",
      confirmText: "Done",
      initialDatePickerMode: initialDatePickerMode??DatePickerMode.year,
    );
  }

}