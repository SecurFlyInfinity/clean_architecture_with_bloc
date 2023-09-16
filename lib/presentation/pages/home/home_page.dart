import 'package:architecture/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_config.dart';
import '../../widget/shared_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.contactColor,
        title: Text(
          ThemeConfig.strings.contacts,
          style: ThemeConfig.styles.style20,
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
              onChanged: (v)=>context.read<HomeBloc>().add(CreateContactEvent(v))
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Width: ${ThemeConfig.dimens.width.toInt()}',
              style: ThemeConfig.styles.style14,
            ),
            Text(
              'Height: ${ThemeConfig.dimens.height.toInt()}',
              style: ThemeConfig.styles.style14,
            ),
            const Divider(),
            Text(
              "Font Big20 Title: ${ThemeConfig.dimens.font20.toInt()}",
              style: ThemeConfig.styles.style20,
            ),
            Text(
              "Font Big18 Title: ${ThemeConfig.dimens.font18.toInt()}",
              style: ThemeConfig.styles.style18,
            ),
            Text(
              "Font Big Title: ${ThemeConfig.dimens.font16.toInt()}",
              style: ThemeConfig.styles.style16,
            ),
            Text(
              "Font Title: ${ThemeConfig.dimens.font14.toInt()}",
              style: ThemeConfig.styles.style14,
            ),
            Text(
              "Subtitle: ${ThemeConfig.dimens.font12.toInt()}",
              style: ThemeConfig.styles.style12,
            ),
            BlocBuilder<HomeBloc,HomeState>(
                builder: (ctx,state){
              return Text(
                context.read<HomeBloc>().text??"",
                style: ThemeConfig.styles.style12,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeConfig.colors.contactColor,
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}