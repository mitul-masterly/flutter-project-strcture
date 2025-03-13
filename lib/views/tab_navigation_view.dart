import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/tab_navigation_cubit.dart';
import 'package:flutter_project_structure/views/history/history_screen.dart';
import 'package:flutter_project_structure/views/home/home_screen.dart';
import 'package:flutter_project_structure/views/profile/profile_screen.dart';

class TabNavigationView extends StatelessWidget {
  const TabNavigationView({super.key});

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final BuildContext context) => TabNavigationCubit(),
      // Providing BLoC at top
      child: BlocBuilder<TabNavigationCubit, int>(
        builder: (final BuildContext context, final int state) {
          return _tabBar(context, state);
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
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
