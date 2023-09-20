import 'package:architecture/data/base/base_response_model.dart';
import 'package:architecture/domain/entity/popular_article_entity.dart';
import 'package:architecture/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements INewsRepository{
  @override
  Future<BaseResponseModel<PopularArticleEntity>> getPopularNews()async {
    // TODO: implement getPopularNews
    throw UnimplementedError();
  }

}