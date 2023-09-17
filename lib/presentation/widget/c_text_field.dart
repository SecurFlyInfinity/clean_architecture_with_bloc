import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final String? hint;
  final TextInputAction? textInputAction;

  const CTextField({super.key, this.controller, this.onChanged,this.prefixIcon,this.hint,this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: null, icon: Icon(prefixIcon,color: ThemeConfig.colors.hintColor,)),
        Expanded(
          child: TextField(
            controller: controller,
            style: ThemeConfig.styles.style14,
            onChanged: onChanged,
            textInputAction: textInputAction,
            decoration: InputDecoration(
                fillColor: Colors.white60,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: ThemeConfig.strings.search,
              label: Text(hint??"",style: ThemeConfig.styles.styleHint14,)
            ),
          ),
        ),
      ],
    );
  }
}
