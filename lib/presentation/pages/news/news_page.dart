import 'package:architecture/domain/shared/dialog_utils.dart';
import 'package:architecture/presentation/pages/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/theme_config.dart';
import '../../widget/news_tile.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsBloc bloc = context.read<NewsBloc>();
    if(bloc.state is NewsInitial){
      bloc.add(GetNewsEvent());
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.wizardColor,
        title: Text(
          ThemeConfig.strings.todayNews,
          style: ThemeConfig.styles.style20,
        ),
        actions: [
          IconButton(
            onPressed: () => bloc.add(GetNewsEvent()),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {

          if (state is NewsLoading) {
            DialogUtils.showLoadingDialog(context, "Please wait");
          }
          if (state is NewsSuccess) {
            DialogUtils.hideLoadingDialog(context);
          }
        },
        builder: (ctx, state) {

          return ListView.builder(
            itemCount: bloc.articles.length,
            itemBuilder: (ctx, index) {
              return NewsTile(
                title: bloc.articles[index].title!,
                description:bloc.articles[index].content!,
                imageUrl: bloc.articles[index].urlToImage!,
                date: bloc.articles[index].publishedAt!,
              );
            },
          );
        },
      ),
    );
  }
}
