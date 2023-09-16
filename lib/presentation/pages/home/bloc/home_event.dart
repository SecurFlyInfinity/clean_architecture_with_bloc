part of 'home_view_model.dart';

@immutable
abstract class HomeEvent {}
class CreateContactEvent extends HomeEvent{
  final data;

  CreateContactEvent(this.data);
}
