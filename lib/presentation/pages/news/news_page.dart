
import 'package:architecture/domain/shared/dialog_utils.dart';
import 'package:architecture/presentation/pages/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/theme_config.dart';
import '../../widget/shared_widget.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.wizardColor,
        title: Text(
          ThemeConfig.strings.todayNews,
          style: ThemeConfig.styles.style20,
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<NewsBloc>().add(GetNewsEvent()),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: BlocListener<NewsBloc, NewsState>(
        listener: (context, state) {
          if(state is NewsLoading){
            DialogUtils.showLoadingDialog(context, "Getting Latest News");
          }
          if(state is NewsSuccess){
            DialogUtils.hideLoadingDialog(context);
          }
        },
        child: Center(
          child: Text(ThemeConfig.strings.todayNews),
        ),
      ),
    );
  }
}
