
import 'package:architecture/config/logger.dart';
import 'package:architecture/data/dao/contact_dao.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/shared/utility.dart';

part 'contacts_event.dart';

part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, HomeState> {
  // late TextEditingController cSearch;
  String? text;
  List<ContactEntity> contacts = [];
  List<ContactEntity> allContacts = [];

  void init() {
    // cSearch = TextEditingController();
    text = "";
  }

  ContactsBloc() : super(HomeInitial()) {
    on<GetContactEvent>(getContacts);
    on<SearchContactEvent>(searchContact);
  }

  void getContacts(GetContactEvent event, Emitter emitter) async {

    Logger.debug(message: "GetContacts");
    contacts.clear();
    allContacts.clear();
    allContacts = await ContactDao().getAllData("");
    contacts.addAll(allContacts);
    contacts.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    emitter.call(HomeRefresh());
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
        style: ThemeConfig.styles.style16,
      );
    }
    return null;
  }

  void searchContact(SearchContactEvent event, Emitter emitter) {
    contacts.clear();
    contacts = allContacts
        .where(
          (element) => element.firstName!
              .toLowerCase()
              .contains(event.text.toLowerCase())
              || element.phone!.toLowerCase().contains(event.text.toLowerCase())
        )
        .toList();
    contacts.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    emitter.call(HomeRefresh());
  }

  void selectContact(int index,bool selected){
    contacts[index].selected = !selected;
    emit(HomeRefresh());
  }
}
