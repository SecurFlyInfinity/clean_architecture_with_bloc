import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(WizardInitial()) {
    on<NewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
