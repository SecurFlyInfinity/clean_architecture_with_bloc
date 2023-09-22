import 'package:architecture/config/logger.dart';
import 'package:architecture/domain/enums/app_state_enum.dart';
import 'package:architecture/domain/usecase/app_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/popular_article_entity.dart';
part 'news_event.dart';

part 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent, NewsState> {

  List<PopularArticleEntity> articles = [];

  NewsBloc() : super(NewsInitial()) {
    on<GetNewsEvent>(getNews);
  }


  void getNews(GetNewsEvent event,Emitter emitter)async{
    emitter.call(NewsLoading());
    articles.clear();
    var res =  await AppUseCase.getPopularNews();
    if(res.state == AppStateEnum.success){
      articles.addAll(res.data);
    }
    Logger.debug(tag:"GetNewsEvent",message: res.message!);
    emitter.call(NewsSuccess());
  }

}
