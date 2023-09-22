import 'package:architecture/data/remote_service/news_service_impl.dart';
import 'package:architecture/domain/entity/popular_article_entity.dart';

import '../../data/base/base_response_model.dart';

abstract class INewsRepository{
  Future<BaseResponseModel<List<PopularArticleEntity>>> getPopularNews(
      {required String search});
}