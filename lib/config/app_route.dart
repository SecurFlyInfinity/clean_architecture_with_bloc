import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:architecture/presentation/pages/contacts/add_contact/add_contact_page.dart';
import 'package:architecture/presentation/pages/contacts/add_contact/bloc/add_contact_bloc.dart';
import 'package:architecture/presentation/pages/contacts/contact_info/contact_info_page.dart';
import 'package:architecture/presentation/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/pages/contacts/all_contacts/bloc/contacts_bloc.dart';
import '../presentation/pages/contacts/all_contacts/contacts_page.dart';
import '../presentation/pages/news/news_page.dart';
import 'extensions/page_navigation.dart';

class AppRoute{
  static const String homeRoute = "/HomePage";
  static const String dashboardRoute = "/DashboardPage";
  static const String newsRoute = "/NewsPage";
  static const String addContactRoute = "/AddContactPage";
  static const String contactInfoRoute = "/ContactInfoPage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case contactInfoRoute:
        ContactEntity contact = settings.arguments as ContactEntity;
        return PageNavigation.push(
          child: ContactInfoPage(contact: contact),
          isLTR: true,
        );
      case addContactRoute:
        return PageNavigation.push(
          child: BlocProvider(
            create: (context) => AddContactBloc(),
            child: AddContactPage(),
          ),
          isLTR: true,
        );
      case homeRoute:
        return PageNavigation.push(
          child: BlocProvider(
            create: (context) => ContactsBloc(),
            child: const ContactsPage(),
          ),
          isLTR: true,
        );
      case dashboardRoute:
        return PageNavigation.push(
          child: const DashboardPage(),
          isLTR: true,
        );
        case newsRoute:
        return PageNavigation.push(
          child: const NewsPage(),
          isLTR: true,
        );
      default:
        return MaterialPageRoute(
            builder: (ctx) => const Scaffold(
              body: Center(child: Text(""),),
            ));
    }
  }
}