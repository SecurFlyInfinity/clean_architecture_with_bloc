import 'package:architecture/presentation/widget/shared_widget.dart';
import 'package:flutter/material.dart';

import '../../../../domain/shared/dialog_utils.dart';
import '../../../theme/theme_config.dart';
import '../../../widget/c_text_field.dart';

class AddContactPage extends StatelessWidget {
  final cFirstName = TextEditingController();
  final cLastName = TextEditingController();
  final cPhone = TextEditingController();
  final cCompany = TextEditingController();
  final cEmail = TextEditingController();

  AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        backgroundColor: ThemeConfig.colors.contactColor,
        title: Text(
          ThemeConfig.strings.createContact,
          style: ThemeConfig.styles.style18,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              DialogUtils.showCustomDialog(
                context,
                title: ThemeConfig.strings.saveContactMsg,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      ThemeConfig.strings.ok,
                      style: ThemeConfig.styles.style16,
                    ),
                  )
                ],
              );
            },
            child: Text(
              ThemeConfig.strings.save,
              style: ThemeConfig.styles.style14,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SizedBox(
        width: ThemeConfig.dimens.width,
        child: Padding(
          padding: EdgeInsets.all(ThemeConfig.dimens.d16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SharedWidget.height(ThemeConfig.dimens.d16),
              CircleAvatar(
                radius: 50,
                backgroundColor: ThemeConfig.colors.contactColor,
                child: const Icon(Icons.add_a_photo_outlined),
              ),
              TextButton(
                onPressed: () {},
                child: Text(ThemeConfig.strings.addPicture),
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                controller: cFirstName,
                hint: ThemeConfig.strings.firstName,
                prefixIcon: Icons.person_outline,
                textInputAction: TextInputAction.next,
                onChanged: (v) {},
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                controller: cLastName,
                hint: ThemeConfig.strings.lastName,
                textInputAction: TextInputAction.next,
                onChanged: (v) {},
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                controller: cCompany,
                hint: ThemeConfig.strings.companyName,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.corporate_fare,
                onChanged: (v) {},
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                controller: cPhone,
                hint: ThemeConfig.strings.phone,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.local_phone_outlined,
                onChanged: (v) {},
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                controller: cEmail,
                hint: ThemeConfig.strings.email,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.email_outlined,
                onChanged: (v) {},
              ),
              SharedWidget.height(ThemeConfig.dimens.d16),
              CTextField(
                hint: ThemeConfig.strings.birthday,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.cake_outlined,
                onChanged: (v) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
