import 'dart:isolate';

import 'package:architecture/presentation/pages/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/logger.dart';
import '../../theme/theme_config.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.wizardColor,
        title: Text(
          ThemeConfig.strings.wizardWorld,
          style: ThemeConfig.styles.style20,
        ),
        actions: [
          IconButton(onPressed: ()=>createTask(), icon: Icon(Icons.send)),
          IconButton(onPressed: ()=>createTask(), icon: Icon(Icons.send))
        ],
      ),
      body: Center(child: CircularProgressIndicator(),),
    );
  }

  void createTask() async {
    // emitter.call(NewsLoading());
    final sender = ReceivePort();

    await Isolate.spawn(task, sender.sendPort);

    sender.listen((total) {
      Logger.debug(message: total.toString());
    });
    // emitter.call(NewsSuccess());
  }

  void task(SendPort port) async{
    int total = 0;
    for (int i = 0; i <= 1000000000; i++) {
      total += i;
    }
    port.send(total);
  }
}
