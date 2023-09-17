import 'dart:async';

import 'package:architecture/config/logger.dart';
import 'package:architecture/data/dao/contact_dao.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'add_contact_event.dart';
part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  AddContactBloc() : super(AddContactInitial()) {
    on<AddContactEvent>((event, emit) {

    });

    on<SaveContactEvent>(saveContact);
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
      profile: null
    );

    ContactDao().insertDB(entity.toJson());
  }
}
