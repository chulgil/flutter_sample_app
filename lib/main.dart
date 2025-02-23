import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/presentation/components/big_button.dart';
import 'package:flutter_sample_app/core/presentation/components/dialogs/rating_dialog.dart';
import 'package:flutter_sample_app/core/presentation/components/filter_button.dart';
import 'package:flutter_sample_app/core/presentation/components/input_field.dart';
import 'package:flutter_sample_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:flutter_sample_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/saved_recipes_screen.dart';
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
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: FutureBuilder<List<Recipe>>(
        future:
            GetSavedRecipesUseCase(
              recipeRepository: MockRecipeRepositoryImpl(),
              bookmarkRepository: MockBookmarkRepositoryImpl(),
            ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final recipes = snapshot.data!;

          return SavedRecipesScreen(recipes: recipes);
        },
      ),
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
