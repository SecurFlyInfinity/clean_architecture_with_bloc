
import 'package:architecture/config/logger.dart';
import 'package:architecture/data/dao/contact_dao.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
 // late TextEditingController cSearch;
  String? text;
  List<ContactEntity> contacts=[];

  void init(){
   // cSearch = TextEditingController();
    text = "";
  }
  HomeBloc() : super(HomeInitial()) {
    on<GetContactEvent>(getContacts);
  }

  void getContacts(GetContactEvent event,Emitter emitter)async{
    Logger.debug(message: "getContacts");
    contacts = await ContactDao().getAllData("");
    emitter.call(HomeRefresh());
  }

}
