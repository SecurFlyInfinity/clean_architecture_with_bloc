import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/domain/shared/utility.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_config.dart';

class ContactInfoPage extends StatelessWidget {
  final ContactEntity contact;
  const ContactInfoPage({super.key,required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.contactColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Center(
        child: Hero(
          tag: contact.phone!,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: getProfile(contact.profile),
            child: getAddImageIcon(contact.profile, contact.firstName!.substring(0,1)),
          ),
        ),
      ),
    );
  }

  ImageProvider? getProfile(String? file) {
    if (file != null) {
      return MemoryImage(Utility.dataFromBase64String(file));
    }
    return null;
  }

  Widget? getAddImageIcon(String? file, String char) {
    if (file == null) {
      return Text(
        char.toUpperCase(),
        style: ThemeConfig.styles.style26,
      );
    }
    return null;
  }
}
