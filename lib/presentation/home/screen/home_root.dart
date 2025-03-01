import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/routing/route_paths.dart';
import 'package:flutter_sample_app/presentation/home/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      name: 'Jega',
      onTapSearchField: () => context.push(RoutePaths.search),
    );
  }
}
