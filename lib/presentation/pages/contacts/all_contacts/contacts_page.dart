import 'package:architecture/config/app_route.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme_config.dart';
import '../../../widget/shared_widget.dart';
import 'bloc/contacts_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<ContactsBloc>().state is HomeInitial) {
      context.read<ContactsBloc>().add(GetContactEvent());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context
                .watch<ContactsBloc>()
                .contacts
                .where((e) => e.selected == true)
                .toList()
                .isNotEmpty
            ? Colors.grey.shade400
            : ThemeConfig.colors.contactColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
        title: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: context
                  .watch<ContactsBloc>()
                  .contacts
                  .where((e) => e.selected == true)
                  .toList()
                  .isNotEmpty
              ? Text(
                  "${context.watch<ContactsBloc>().contacts.where((e) => e.selected == true).toList().length} Selected",
                  style: ThemeConfig.styles.style18,
                )
              : Text(
                  ThemeConfig.strings.contacts,
                  style: ThemeConfig.styles.style18,
                ),
        ),
        actions: [
          context
                  .watch<ContactsBloc>()
                  .contacts
                  .where((e) => e.selected == true)
                  .toList()
                  .isNotEmpty
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 26,
                  ))
              : IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),

          SharedWidget.width(16)
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SharedWidget.search(
                onChanged: (v) =>
                    context.read<ContactsBloc>().add(SearchContactEvent(v))),
          ),
        ),
      ),
      body: BlocBuilder<ContactsBloc, HomeState>(
        builder: (context, state) {
          ContactsBloc bloc = context.read<ContactsBloc>();
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemBuilder: (ctx, index) {
                ContactEntity contact = bloc.contacts[index];
                return ListTile(
                  onLongPress: () {
                    bloc.selectContact(index, contact.selected ?? false);
                  },
                  onTap: () {
                    if (bloc.contacts
                        .where((e) => e.selected == true)
                        .toList()
                        .isNotEmpty) {
                      bloc.selectContact(index, contact.selected ?? false);
                    } else {
                      Navigator.pushNamed(context, AppRoute.contactInfoRoute,
                          arguments: contact);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  leading: Hero(
                    tag: contact.phone!,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: bloc.getProfile(contact.profile),
                        child: bloc.getAddImageIcon(contact.profile,
                            contact.firstName!.substring(0, 1))),
                  ),
                  trailing: Visibility(
                    visible: contact.selected ?? false,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      value: contact.selected ?? false,
                      onChanged: (v) {
                        contact.selected = v;
                      },
                    ),
                  ),
                  title: Text(contact.fullName.toString()),
                );
              },
              itemCount: bloc.contacts.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeConfig.colors.contactColor,
        onPressed: () => Navigator.pushNamed(context, AppRoute.addContactRoute)
            .then((value) {
          if (value != null) {
            context.read<ContactsBloc>().add(GetContactEvent());
          }
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
