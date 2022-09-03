import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
    label: 'Business',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.sports_rounded),
    label: 'Sports',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.science),
    label: 'Science',
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.settings),
    label: 'Settings',
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];
  void changeBottomNavBar (int index){
  currentIndex = index;
  emit(NewsBottomNavState());
  }


}
