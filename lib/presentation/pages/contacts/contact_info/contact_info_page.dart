import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/domain/shared/utility.dart';
import 'package:architecture/presentation/widget/c_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/theme_config.dart';
import '../../../widget/shared_widget.dart';

class ContactInfoPage extends StatelessWidget {
  final ContactEntity contact;

  const ContactInfoPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            //IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: ThemeConfig.dimens.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: contact.phone!,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: getProfile(contact.profile),
                      child: getAddImageIcon(
                          contact.profile, contact.firstName!.substring(0, 1)),
                    ),
                  ),
                  SharedWidget.height(ThemeConfig.dimens.d18),
                  Text(
                    contact.fullName!,
                    style: ThemeConfig.styles.style24,
                  ),
                  SharedWidget.height(35),
                  CShape(
                    backgroundColor: ThemeConfig.colors.contactShadeColor,
                    radius: 10,
                    width: ThemeConfig.dimens.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ThemeConfig.strings.contactInfo,
                            style: ThemeConfig.styles.style14.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SharedWidget.height(ThemeConfig.dimens.d8),
                          ListTile(
                            onTap: () async {
                              SharedWidget.snackBar(
                                context: context,
                                content: Row(
                                  children: [
                                    const Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SharedWidget.width(16),
                                    Text(
                                      contact.phone!,
                                      style: ThemeConfig.styles.style14
                                          .copyWith(
                                          color: Colors.white,
                                          letterSpacing: 1.3),
                                    ),
                                  ],
                                ),
                              );

                              await Clipboard.setData(
                                  ClipboardData(text: contact.phone!));

                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            leading: const Icon(Icons.phone_outlined),
                            title: Text(
                              contact.phone.toString(),
                              style: ThemeConfig.styles.style16,
                            ),
                          ),
                          Visibility(
                            visible: contact.email != null,
                            child: ListTile(
                              onTap: () async {
                                SharedWidget.snackBar(
                                  context: context,
                                  content: Row(
                                    children: [
                                      const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SharedWidget.width(16),
                                      Text(
                                        contact.email!,
                                        style: ThemeConfig.styles.style14
                                            .copyWith(
                                            color: Colors.white,
                                            letterSpacing: 1.3),
                                      ),
                                    ],
                                  ),
                                );

                                await Clipboard.setData(
                                    ClipboardData(text: contact.email!));

                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              leading: const Icon(Icons.email_outlined),
                              title: Text(
                                contact.email.toString(),
                                style: ThemeConfig.styles.style16,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: contact.companyName != null,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              leading: const Icon(Icons.corporate_fare),
                              title: Text(
                                contact.companyName.toString(),
                                style: ThemeConfig.styles.style16,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: contact.dateOfBirth != null,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              leading: const Icon(Icons.cake_outlined),
                              title: Text(
                                contact.dateOfBirth.toString(),
                                style: ThemeConfig.styles.style16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
