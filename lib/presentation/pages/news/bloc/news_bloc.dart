
import 'package:architecture/config/logger.dart';
import 'package:architecture/domain/usecase/app_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>(getNews);
  }

  void getNews(NewsEvent event,Emitter emitter)async{
    if(event is GetNewsEvent){
      emitter.call(NewsLoading());
      var res =  await AppUseCase().getPopularNews();
      Logger.debug(tag:"GetNewsEvent",message: res.message!);
      emitter.call(NewsSuccess());
    }
  }

}
