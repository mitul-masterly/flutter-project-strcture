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
    return BlocProvider(
      create: (final BuildContext context) =>
          TabNavigationCubit()..updateTab(initialTabIndex),
      // Providing BLoC at top
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
    if (Platform.isAndroid) {
      return _androidTabBar(context, state);
    } else {
      return _iOSTabBar(context, state);
    }
  }

  Widget _androidTabBar(final BuildContext context, final int state) {
    return Scaffold(
      body: _pages[state], // Dynamic page based on state
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'.tr(context)),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'.tr(context)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'.tr(context)),
        ],
        currentIndex: state,
        selectedItemColor: Colors.blue,
        onTap: (final int index) =>
            context.read<TabNavigationCubit>().updateTab(index), // Update tab
      ),
    );
  }

  Widget _iOSTabBar(final BuildContext context, final int state) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: state,
        onTap: (final int index) =>
            context.read<TabNavigationCubit>().updateTab(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            label: 'History'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile'.tr(context),
          ),
        ],
      ),
      tabBuilder: (final BuildContext context, final int index) {
        return CupertinoTabView(
          builder: (final BuildContext context) => _pages[index],
        );
      },
    );
  }
}
