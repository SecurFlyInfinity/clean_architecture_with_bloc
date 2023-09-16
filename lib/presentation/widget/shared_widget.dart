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
}