import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final String? hint;
  final int? maxLength;
  final bool? enable;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;

  const CTextField({super.key, this.controller, this.onChanged,this.prefixIcon,this.hint,this.textInputAction,this.onTap,this.enable,this.readOnly,this.maxLength,this.keyboardType});

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
            onTap: onTap,
            maxLength: maxLength,
            enabled: enable,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            readOnly: readOnly??false,
            decoration: InputDecoration(
                fillColor: Colors.white60,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                counterText: "",
                hintText: hint,
              label: Text(hint??"",style: ThemeConfig.styles.styleHint14,)
            ),
          ),
        ),
      ],
    );
  }
}
