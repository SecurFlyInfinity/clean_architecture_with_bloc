import 'package:architecture/config/logger.dart';
import 'package:architecture/presentation/pages/contacts/add_contact/bloc/add_contact_bloc.dart';
import 'package:architecture/presentation/widget/c_shape.dart';
import 'package:architecture/presentation/widget/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../domain/shared/dialog_utils.dart';
import '../../../../domain/shared/validators.dart';
import '../../../theme/theme_config.dart';
import '../../../widget/c_text_field.dart';

class AddContactPage extends StatelessWidget {
  final cFirstName = TextEditingController();
  final cLastName = TextEditingController();
  final cPhone = TextEditingController();
  final cCompany = TextEditingController();
  final cEmail = TextEditingController();
  final cDOB = TextEditingController();

  AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              dispose();
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
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              checkAndSave(context);
            },
            child: Text(
              ThemeConfig.strings.save,
              style: ThemeConfig.styles.style14,
            ),
          ),
          SharedWidget.width(20)
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: ThemeConfig.dimens.width,
          child: Padding(
            padding: EdgeInsets.all(ThemeConfig.dimens.d16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SharedWidget.height(ThemeConfig.dimens.d16),
                BlocBuilder<AddContactBloc, AddContactState>(
                  builder: (context, state) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => context
                          .read<AddContactBloc>()
                          .add(PickImageEvent(ImageSource.gallery)),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            context.read<AddContactBloc>().getProfile(),
                        backgroundColor: ThemeConfig.colors.contactColor,
                        child: state is AddContactLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : context.read<AddContactBloc>().getAddImageIcon(),
                      ),
                    );
                  },
                ),
                TextButton(
                  onPressed: () => context
                      .read<AddContactBloc>()
                      .add(PickImageEvent(ImageSource.gallery)),
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
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
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
                  controller: cDOB,
                  hint: ThemeConfig.strings.birthday,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.cake_outlined,
                  readOnly: true,
                  onTap: () async {
                    var date = await SharedWidget.datePicker(
                        context: context, initialDate: DateTime(2000));
                    if (date != null) {
                      cDOB.text = DateFormat.yMMMd().format(date);
                      Logger.debug(message: cDOB.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkAndSave(BuildContext context) {
    if (Validators.containsOnlyWhitespace(cFirstName.text) ||
        Validators.containsOnlyWhitespace(cPhone.text)) {
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
    } else {
      context.read<AddContactBloc>().add(SaveContactEvent(
            firstName: cFirstName.text,
            phone: cPhone.text,
            company: cCompany.text,
            email: cEmail.text,
            lastName: cLastName.text,
            dob: cDOB.text,
          ));
      Navigator.pop(context, true);
    }
  }

  void dispose() {
    cFirstName.dispose();
    cLastName.dispose();
    cEmail.dispose();
    cCompany.dispose();
    cPhone.dispose();
  }
}
