
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
  String tag = "ContactsBlocTAG";
  List<ContactEntity> contacts = [];
  List<ContactEntity> allContacts = [];

  ContactsBloc() : super(HomeInitial()) {
    on<GetContactEvent>(getContacts);
    on<SearchContactEvent>(searchContact);
    on<DeleteContactEvent>(deleteContacts);
    on<SelectContactEvent>(selectContact);
    on<ResetContactEvent>(resetSelectedContact);
  }

  bool get isSelected => contacts
      .where((e) => e.selected == true)
      .toList()
      .isNotEmpty;

  int get selectedLength => contacts
      .where((e) => e.selected == true)
      .toList().length;

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

  ///
  /// FEATURE - Get all contacts
  ///
  void getContacts(GetContactEvent event, Emitter emitter) async {

    Logger.debug(tag:tag,message: "GetContacts");
    contacts.clear();
    allContacts.clear();
    allContacts = await ContactDao().getAllData("");
    contacts.addAll(allContacts);
    contacts.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    emitter.call(HomeRefresh());
  }

  ///
  /// FEATURE - Search Contacts
  ///
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

  ///
  /// FEATURE - Select Contacts
  ///
  void selectContact(SelectContactEvent event, Emitter emitter){
    contacts[event.index].selected = !event.isSelected;
    emitter.call(HomeRefresh());
  }

  ///
  /// FEATURE - Reset Selected Contacts
  ///
  void resetSelectedContact(ResetContactEvent event, Emitter emitter){
    for(var i in contacts){
      i.selected=false;
    }
    emitter.call(HomeRefresh());
  }


  ///
  /// FEATURE - Delete Selected Contacts
  ///
  void deleteContacts(DeleteContactEvent event, Emitter emitter)async{
    var selectedContacts = contacts
        .where((e) => e.selected == true)
        .toList();

    await ContactDao().deleteListOfContact(selectedContacts);

    Logger.debug(tag:tag,message: "GetContacts");
    contacts.clear();
    allContacts.clear();
    allContacts = await ContactDao().getAllData("");
    contacts.addAll(allContacts);
    contacts.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    emitter.call(HomeRefresh());
  }

}
