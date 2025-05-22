import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/bloc/tab_navigation_cubit.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/views/history/history_screen.dart';
import 'package:flutter_project_structure/views/home/home_screen.dart';
import 'package:flutter_project_structure/views/profile/profile_screen.dart';

class TabNavigationView extends StatelessWidget {
 const TabNavigationView(
      {super.key, this.initialTabIndex = 0}); // Default to Home
  final int initialTabIndex;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<TabNavigationCubit>(
      create: (final BuildContext context) =>
          TabNavigationCubit()..updateTab(initialTabIndex),
      child: BlocBuilder<TabNavigationCubit, int>(
        builder: (final BuildContext context, final int navState) {
          return BlocBuilder<LocalisationBloc, LocalisationState>(builder:
              (final BuildContext context, final LocalisationState state) {
            return _tabBar(context, navState);
          });
        },
      ),
    );
  }

  Widget _tabBar(final BuildContext context, final int state) {
    return Scaffold(
      body: _pages[state], // Dynamic page based on state
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Platform.isAndroid ? Icons.home : CupertinoIcons.home), label: 'Home'.tr(context)),
          BottomNavigationBarItem(
              icon: Icon(Platform.isAndroid ? Icons.history : CupertinoIcons.time), label: 'History'.tr(context)),
          BottomNavigationBarItem(
              icon: Icon(Platform.isAndroid ? Icons.person : CupertinoIcons.person), label: 'Profile'.tr(context)),
        ],
        currentIndex: state,
        selectedItemColor: Colors.blue,
        onTap: (final int index) =>
            context.read<TabNavigationCubit>().updateTab(index), // Update tab
      ),
    );
  }
}
