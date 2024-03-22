import 'package:flutter/material.dart';
import 'package:pomodoro/provider/mode_provider.dart';
import 'package:pomodoro/theme_mode.dart';
import 'package:provider/provider.dart';

void main() {
  // we use cascade operator {..}
  //to  make  multiple function call
  // or multiple value assignment sequentially
  //over objects in a single statement.
  runApp(ChangeNotifierProvider(
      create: (context) => ModeProvider()..getTheme(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Animation theme style by Flutter 3.19.3 version
      themeAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOutSine),
      // provider.of  statement ,
      //  .....?..... : .....  ternary operator,
      theme: Provider.of<ModeProvider>(context).lightModeEnable
          ? ModeTheme.lightMode
          : ModeTheme.darkMode,
      title: 'pomodoro',
      home: MyHomePage(Provider.of<ModeProvider>(context).lightModeEnable),
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool isLight;
  MyHomePage(this.isLight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Container(
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             fit: BoxFit.fill,
        //             image: AssetImage(isLight
        //                 ? "assets/images/bg_light.jpg"
        //
        //                : "assets/images/bg_dark.jpg")))),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // using  Button
            Center(
              child: ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<ModeProvider>(context, listen: false)
                        .chaneMode();
                  },
                  icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
                  label: Text(isLight ? "dark" : "Light")),
            ),

            //using switch,

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text("Dark Mode"),
            //     Switch(
            //         value: !isLight,
            //         onChanged: (value) {
            //           Provider.of<ModeProvider>(context, listen: false)
            //               .chaneMode();
            //         }),
            //   ],
            // )
          ],
        ),
      ],
    ));
  }
}
