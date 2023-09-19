abstract class INewsService{
  Future<dynamic> getPopularNews();
}

class NewsServiceImpl implements INewsService{

  @override
  Future getPopularNews() {
    // TODO: implement getPopularNews
    throw UnimplementedError();
  }

}