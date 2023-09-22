import 'dart:io';
import 'package:architecture/data/dto/popular_articles_dto.dart';
import 'package:architecture/data/keys/app_keys.dart';
import 'package:architecture/data/keys/nework_utils.dart';
import '../../domain/types/type_def.dart';
import '../exception/remote_data_source_exception.dart';
import '../exception/exceptions.dart';


abstract class INewsService{
  Future<dynamic> getPopularNews(JSON<dynamic> queryParams);
}

class NewsServiceImpl implements INewsService{

  @override
  Future<dynamic> getPopularNews(JSON<dynamic> queryParams) async{
    try{

      Uri uri = Uri.https(AppKeys.remoteKey.baseURL,AppKeys.remoteKey.pathEverythingURL,queryParams);
      JSON<dynamic> res = await NetworkUtils.get(uri,headers: AppKeys.remoteKey.headers,);
      return PopularArticlesDto.fromJson(res);

    }on SocketException{
      throw NoConnectionException(true,"Please check your internet connection");
    }catch(e){
      throw RemoteDataSourceException(300, e.toString());
    }
  }

}