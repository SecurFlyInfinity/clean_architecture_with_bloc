
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
            SharedWidget.snackBar(
              context: context,
              content: Text(
                "Downloading...",
                style: ThemeConfig.styles.style14
                    .copyWith(
                    color: Colors.white,
                    letterSpacing: 1.3),
              ),
            );
          }
          if(state is NewsSuccess){
            SharedWidget.snackBar(
              context: context,
              content: Text(
                "Successfully",
                style: ThemeConfig.styles.style14
                    .copyWith(
                    color: Colors.white,
                    letterSpacing: 1.3),
              ),
            );
          }
        },
        child: Center(
          child: Text(ThemeConfig.strings.todayNews),
        ),
      ),
    );
  }
}
