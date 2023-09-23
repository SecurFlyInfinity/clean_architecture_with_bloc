part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
class GetNewsEvent extends NewsEvent{
  final String searchText;

  GetNewsEvent(this.searchText);
}
