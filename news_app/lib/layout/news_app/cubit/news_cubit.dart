import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/network_helper.dart';

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
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index == 1) {
      getSportData();
    }
    if (index == 2) {
      getScienceData();
    }
    
    emit(NewsBottomNavState());
  }

  List<Map<String, dynamic>> business = [];

  getBusinessData() {
    emit(NewsGetBusinessLoadingState());
    NetworkHelper.getData(url: 'v2/everything', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'fb58dcb9507b4c59a6e5459bfeec07fa'
    }).then((value) {
      business = value.data['atricles'];
      emit(NewsGetBusinessSucsessState());
    }).catchError((erorr) {
      emit(NewsGetBusinessErorrState(erorr.toString()));
    });
  }

  List<Map<String, dynamic>> sports = [];

  getSportData() {
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty){
      NetworkHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSucsessState());
    }).catchError((erorr) {
      emit(NewsGetSportsErorrState(erorr.toString()));
    });
    }else {
      emit(NewsGetSportsSucsessState());
    }
  }

  List<Map<String, dynamic>> science = [];

  getScienceData() {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty){
      NetworkHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSucsessState());
    }).catchError((erorr) {
      emit(NewsGetScienceErorrState(erorr.toString()));
    });
    }else{
      emit(NewsGetScienceSucsessState());
    }
  }
}
