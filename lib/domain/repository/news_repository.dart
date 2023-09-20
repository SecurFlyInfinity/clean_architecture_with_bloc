import 'package:architecture/domain/entity/popular_article_entity.dart';

import '../../data/base/base_response_model.dart';

abstract class INewsRepository{
  Future<BaseResponseModel<PopularArticleEntity>> getPopularNews();
}