import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/main_cubit.dart';
import '../widgets/main_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          context.read<MainCubit>().setPageIndex(index);
        },
        controller: context.read<MainCubit>().pageController,
        children: context.read<MainCubit>().pages,
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
