part of 'add_contact_bloc.dart';

@immutable
abstract class AddContactState {}

class AddContactInitial extends AddContactState {}
class AddContactLoading extends AddContactState {}
class AddContactRefresh extends AddContactState {}
