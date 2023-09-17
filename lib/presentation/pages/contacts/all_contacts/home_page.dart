import 'package:architecture/config/app_route.dart';
import 'package:architecture/domain/entity/contact_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme_config.dart';
import '../../../widget/shared_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if(context.read<HomeBloc>().state is HomeInitial){
      context.read<HomeBloc>().add(GetContactEvent());
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.contactColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: Text(
          ThemeConfig.strings.contacts,
          style: ThemeConfig.styles.style18,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sunny)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SharedWidget.search(
                onChanged: (v) {

                }),
          ),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state is HomeInitial){
            context.read<HomeBloc>().add(GetContactEvent());
          }
        },
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                ContactEntity contact = context.read<HomeBloc>().contacts[index];
                return ListTile(
                  title: Text(contact.firstName.toString()),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: context.read<HomeBloc>().contacts.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeConfig.colors.contactColor,
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.addContactRoute).then((value){
            context.read<HomeBloc>().add(GetContactEvent());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
