import 'package:architecture/domain/enums/app_state_enum.dart';

abstract class BaseResponseModel<T>{
  AppStateEnum state;
  T data;

  BaseResponseModel({required this.state, required this.data});

}