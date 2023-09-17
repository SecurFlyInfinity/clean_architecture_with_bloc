part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}
class GetContactEvent extends ContactsEvent{}
class SearchContactEvent extends ContactsEvent{
  final String text;
  SearchContactEvent(this.text);
}

