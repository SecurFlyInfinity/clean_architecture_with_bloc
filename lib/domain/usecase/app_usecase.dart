import 'package:architecture/data/remote_service/news_service_impl.dart';
import 'package:architecture/data/repository/news_repository_impl.dart';
import 'package:architecture/domain/entity/popular_article_entity.dart';
import 'package:architecture/domain/repository/news_repository.dart';

import '../../data/base/base_response_model.dart';

class AppUseCase{
  INewsRepository newsRepository = NewsRepositoryImpl(service: NewsServiceImpl());

  Future<BaseResponseModel<List<PopularArticleEntity>?>> getPopularNews({String? search})async{
    return await newsRepository.getPopularNews(search: search??"technical");
  }
}