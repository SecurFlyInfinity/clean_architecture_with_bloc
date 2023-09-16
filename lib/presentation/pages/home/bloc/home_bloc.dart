
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
 // late TextEditingController cSearch;
  String? text;
  void init(){
   // cSearch = TextEditingController();
    text = "";
  }
  HomeBloc() : super(HomeInitial()) {
    on<CreateContactEvent>(createContact);
  }

  void createContact(CreateContactEvent event,Emitter emitter){
    text = event.data;
    emitter.call(HomeRefresh());
  }

  // void createContact(String data){
  //   text = data;
  //   emit(HomeRefresh());
  // }

  void dispose(){
    //cSearch.dispose();
  }
}
