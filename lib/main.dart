import 'package:architecture/config/initialize.dart';
import 'package:architecture/presentation/pages/home/bloc/home_view_model.dart';
import 'package:architecture/presentation/theme/screen_dimens.dart';
import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
          child: const HomePage()
      )
    );
  }
}


