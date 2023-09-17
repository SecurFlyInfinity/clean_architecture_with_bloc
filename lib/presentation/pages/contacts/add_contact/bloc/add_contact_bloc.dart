import 'dart:async';
import 'dart:typed_data';

import 'package:architecture/config/logger.dart';
import 'package:architecture/data/dao/contact_dao.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/domain/shared/utility.dart';
import 'package:architecture/presentation/pages/contacts/all_contacts/bloc/contacts_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'add_contact_event.dart';
part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {

  Uint8List? file;
  AddContactBloc() : super(AddContactInitial()) {
    on<PickImageEvent>(pickImage);
    on<SaveContactEvent>(saveContact);
  }

  void pickImage(PickImageEvent event, Emitter emitter)async{

    var image = await ImagePicker().pickImage(source: event.source);
    if(image!=null){
      emitter.call(AddContactLoading());
      Uint8List _file = await image.readAsBytes();
      file = await Utility.compressImageSize(_file);
    }
    emitter.call(AddContactRefresh());
  }

  ImageProvider? getProfile(){
    if(file!=null){
      return MemoryImage(file!);
    }
    return null;
  }

  Widget? getAddImageIcon(){
    if(file==null){
      return const Icon(Icons.add_a_photo_outlined);
    }
    return null;
  }
  void saveContact(SaveContactEvent event, Emitter emitter){

    ContactEntity entity = ContactEntity(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      phone: event.phone,
      addOn: DateTime.now().toString(),
      companyName: event.company,
      dateOfBirth: event.dob,
      profile: file!=null?Utility.base64String(file!):null
    );

    ContactDao().insertDB(entity.toJson());
  }


}
