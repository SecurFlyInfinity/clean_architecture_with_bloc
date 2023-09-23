part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}
class GetContactEvent extends ContactsEvent{}
class DeleteContactEvent extends ContactsEvent{}
class ResetContactEvent extends ContactsEvent{}
class SelectContactEvent extends ContactsEvent{
  final int index;
  final bool isSelected;

  SelectContactEvent(this.index, this.isSelected);
}
class SearchContactEvent extends ContactsEvent{
  final String text;
  SearchContactEvent(this.text);
}

