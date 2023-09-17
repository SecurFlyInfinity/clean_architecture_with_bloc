part of 'add_contact_bloc.dart';

@immutable
abstract class AddContactEvent {}
class SaveContactEvent extends AddContactEvent{
  final firstName;
  final lastName;
  final company;
  final phone;
  final email;
  final dob;

  SaveContactEvent(
      {required this.firstName,
      this.lastName,
      this.company,
        required this.phone,
      this.email,
      this.dob});
}

class PickImageEvent extends AddContactEvent{
  final source;
  PickImageEvent(this.source);
}
