import 'package:architecture/config/initialize.dart';
import 'package:architecture/presentation/theme/screen_dimens.dart';
import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Initialize.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          ThemeConfig.strings.appName,
          style: ThemeConfig.styles.style14,
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
            Divider(),
            Text(
              "FontBig20Title: ${ThemeConfig.dimens.font20.toInt()}",
              style: ThemeConfig.styles.style20,
            ),
            Text(
              "FontBig18Title: ${ThemeConfig.dimens.font18.toInt()}",
              style: ThemeConfig.styles.style18,
            ),
            Text(
              "FontBigTitle: ${ThemeConfig.dimens.font16.toInt()}",
              style: ThemeConfig.styles.style16,
            ),
            Text(
              "FontTitle: ${ThemeConfig.dimens.font14.toInt()}",
              style: ThemeConfig.styles.style14,
            ),
            Text(
              "Subtitle: ${ThemeConfig.dimens.font12.toInt()}",
              style: ThemeConfig.styles.style12,
            ),
          ],
        ),
      ),
    );
  }
}
