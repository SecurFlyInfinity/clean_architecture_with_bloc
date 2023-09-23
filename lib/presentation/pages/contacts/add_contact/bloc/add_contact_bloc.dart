import 'dart:typed_data';

import 'package:architecture/data/dao/contact_dao.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/domain/shared/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

part 'add_contact_event.dart';

part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  Uint8List? _file;

  AddContactBloc() : super(AddContactInitial()) {
    on<PickImageEvent>(pickImage);
    on<SaveContactEvent>(saveContact);
  }

  pickImage(PickImageEvent event, Emitter emitter) async {
    var image = await ImagePicker().pickImage(source: event.source);
    if (image != null) {
      emitter.call(AddContactLoading());
      Uint8List file = await image.readAsBytes();
      _file = await Utility.compressImageSize(file);
    }
    emitter.call(AddContactRefresh());
  }

  ImageProvider? getProfile() {
    if (_file != null) {
      return MemoryImage(_file!);
    }
    return null;
  }

  Widget? getAddImageIcon() {
    if (_file == null) {
      return const Icon(Icons.add_a_photo_outlined);
    }
    return null;
  }

  void saveContact(SaveContactEvent event, Emitter emitter) {
    ContactEntity entity = ContactEntity(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        addOn: DateTime.now().toString(),
        companyName: event.company,
        dateOfBirth: event.dob,
        profile: _file != null ? Utility.base64String(_file!) : null);

    ContactDao().insertDB(entity.toJson());
  }
}
