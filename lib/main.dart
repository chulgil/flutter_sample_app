import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/presentation/components/big_button.dart';
import 'package:flutter_sample_app/core/presentation/components/dialogs/rating_dialog.dart';
import 'package:flutter_sample_app/core/presentation/components/filter_button.dart';
import 'package:flutter_sample_app/core/presentation/components/input_field.dart';
import 'package:flutter_sample_app/ui/text_styles.dart';

import 'core/presentation/components/medium_button.dart';
import 'core/presentation/components/rating_button.dart';
import 'core/presentation/components/small_button.dart';
import 'core/presentation/components/two_tab.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component', style: TextStyles.largeTextBold),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return RatingDialog(
                    title: 'RatingDialog',
                    score: 4,
                    actionName: 'send',
                    onChange: (score) {
                      print(score);
                    },
                  );
                },
              );
            },
            child: const Text('RatingDialog'),
          ),
          TwoTab(
            labels: const ['label 1', 'label 2'],
            selectedIndex: 0,
            onChange: (int index) {
              print('TowTab: $index');
            },
          ),
          RatingButton('text'),
          RatingButton('text', isSelected: true),
          FilterButton('text'),
          FilterButton('text', isSelected: true),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              text: 'Big Button',
              onPressed: () {
                print('BigButton');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              text: 'Medium',
              onPressed: () {
                print('MediumButton');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              text: 'Small',
              onPressed: () {
                print('SmallButton');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(label: 'label', placeHolder: 'placeHolder'),
          ),
        ],
      ),
    );
  }
}
