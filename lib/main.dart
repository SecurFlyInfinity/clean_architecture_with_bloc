import 'package:architecture/config/initialize.dart';
import 'package:architecture/presentation/theme/screen_dimens.dart';
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
      home:  MyHomePage(),
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
        title: const Text("Screen Config"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Width: ${ScreenDimens.width.toInt()}',
              style: TextStyle(
                fontSize: ScreenDimens.font14
              ),
            ),
            Text(
              'Height: ${ScreenDimens.height.toInt()}',
              style: TextStyle(
                  fontSize: ScreenDimens.font14
              ),
            ),
            Divider(),
            Text(
              "FontBig20Title: ${ScreenDimens.font20.toInt()}",
              style: TextStyle(
                  fontSize: ScreenDimens.font20
              ),
            ),
            Text(
              "FontBig18Title: ${ScreenDimens.font18.toInt()}",
              style: TextStyle(
                  fontSize: ScreenDimens.font18
              ),
            ),
            Text(
              "FontBigTitle: ${ScreenDimens.font16.toInt()}",
              style: TextStyle(
                  fontSize: ScreenDimens.font16
              ),
            ),
            Text(
              "FontTitle: ${ScreenDimens.font14.toInt()}",
              style: TextStyle(
                  fontSize: ScreenDimens.font14
              ),
            ),
            Text(
              "Subtitle: ${ScreenDimens.font12.toInt()}",
              style: TextStyle(
                  fontSize: ScreenDimens.font12
              ),
            ),
          ],
        ),
      ),
    );
  }
}
