import 'package:architecture/data/base/base_response_model.dart';
import 'package:architecture/data/dto/popular_articles_dto.dart';
import 'package:architecture/data/exception/data_not_found_exception.dart';
import 'package:architecture/data/exception/exceptions.dart';
import 'package:architecture/data/keys/app_keys.dart';
import 'package:architecture/data/remote_service/news_service_impl.dart';
import 'package:architecture/domain/entity/popular_article_entity.dart';
import 'package:architecture/domain/enums/app_state_enum.dart';
import 'package:architecture/domain/repository/news_repository.dart';
import 'package:architecture/domain/types/type_def.dart';
import 'package:intl/intl.dart';

class NewsRepositoryImpl extends INewsRepository<INewsService> {

  @override
  Future<BaseResponseModel<List<PopularArticleEntity>>> getPopularNews(
      {required String search}) async {
    try{
      JSON<dynamic> queryParams = {
        "q": search,
        "from": DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(days: 1))),
        "to": DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(days: 1))),
        "sortBy": "popularity",
        "apiKey": AppKeys.remoteKey.apiKey
      };
      PopularArticlesDto response = await service.getPopularNews(queryParams);
      if (response.status!.contains("ok")) {
        if(response.articles!.isEmpty){
          throw DataNotFoundException(true,AppKeys.localKey.noDataFound);
        }
        return BaseResponseModel<List<PopularArticleEntity>>(
          state: AppStateEnum.success,
          data: PopularArticleEntity.createArticleArray(response.articles!),
          message: AppKeys.localKey.totalPopularNews(response.articles!.length.toString())
        );
      }
      return BaseResponseModel<List<PopularArticleEntity>>(
          state: AppStateEnum.error, data: [],
          message: AppKeys.localKey.invalidParams);
    }on DataNotFoundException{
      return BaseResponseModel<List<PopularArticleEntity>>(
          state: AppStateEnum.empty, data: [],
      message: AppKeys.localKey.haveNotResult);
    }on NoConnectionException{
      return BaseResponseModel<List<PopularArticleEntity>>(
          state: AppStateEnum.socket, data: [],
      message: AppKeys.localKey.checkNetwork);
    }catch(e){
      return BaseResponseModel<List<PopularArticleEntity>>(
          state: AppStateEnum.error, data: [],
      message: e.toString());
    }
  }
}
