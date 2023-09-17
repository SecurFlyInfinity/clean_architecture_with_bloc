import 'package:architecture/presentation/pages/contacts/add_contact/add_contact_page.dart';
import 'package:architecture/presentation/pages/contacts/add_contact/bloc/add_contact_bloc.dart';
import 'package:architecture/presentation/pages/dashboard/dashboard_page.dart';
import 'package:architecture/presentation/pages/wizards/wizard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/pages/contacts/all_contacts/bloc/home_bloc.dart';
import '../presentation/pages/contacts/all_contacts/home_page.dart';
import 'extensions/page_navigation.dart';

class AppRoute{
  static const String homeRoute = "/HomePage";
  static const String dashboardRoute = "/DashboardPage";
  static const String wizardRoute = "/WizardPage";
  static const String addContactRoute = "/AddContactPage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
            create: (context) => HomeBloc(),
            child: const HomePage(),
          ),
          isLTR: true,
        );
      case dashboardRoute:
        return PageNavigation.push(
          child: const DashboardPage(),
          isLTR: true,
        );
        case wizardRoute:
        return PageNavigation.push(
          child: const WizardPage(),
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