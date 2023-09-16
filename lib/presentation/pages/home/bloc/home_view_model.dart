import 'dart:async';

import 'package:architecture/config/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
 // late TextEditingController cSearch;
  String? text;
  void init(){
   // cSearch = TextEditingController();
    text = "";
  }
  HomeViewModel() : super(HomeInitial()) {
   // on<CreateContactEvent>(createContact);
  }

  // void createContact(CreateContactEvent event,Emitter emitter){
  //   Logger.debug(message: event.data,tag: "onChangeSearch");
  //   text = event.data;
  //   emit(HomeRefresh(event.data));
  // }

  void createContact(String data){
    text = data;
    emit(HomeRefresh());
  }

  void dispose(){
    //cSearch.dispose();
  }
}
