part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class CreateContactEvent extends HomeEvent{
  final String data;

  CreateContactEvent(this.data);
}
