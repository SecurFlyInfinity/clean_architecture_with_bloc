import 'package:architecture/data/base/base_response_model.dart';
import 'package:architecture/domain/entity/popular_article_entity.dart';
import 'package:architecture/domain/enums/app_state_enum.dart';
import 'package:architecture/domain/repository/news_repository.dart';
import 'package:architecture/domain/usecase/app_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNewsRepository extends Mock implements INewsRepository{}

void main(){
  AppUseCase useCase= AppUseCase();
  MockNewsRepository mockNewsRepository = MockNewsRepository();
  BaseResponseModel<List<PopularArticleEntity>> responseModel= BaseResponseModel<List<PopularArticleEntity>>(data: [],state: AppStateEnum.success);
  // setUp(() {
  //   mockNewsRepository = MockNewsRepository();
  //   useCase = AppUseCase();
  //   responseModel = BaseResponseModel<List<PopularArticleEntity>>(data: [],state: AppStateEnum.success);
  // });


  test("Get Popular News Articles", ()async{

    // arrange
    //when(mockNewsRepository.getPopularNews(search: "")).thenAnswer((realInvocation) async => responseModel);

    // act
    //final result = await useCase.getPopularNews();

    // assert
    //expect(responseModel, result);
  });
}