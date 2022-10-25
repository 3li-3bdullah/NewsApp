part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSucsessState extends NewsState {}

class NewsGetBusinessErorrState extends NewsState {
   final String erorr;
   NewsGetBusinessErorrState(this.erorr);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSucsessState extends NewsState {}

class NewsGetSportsErorrState extends NewsState {
   final String erorr;
   NewsGetSportsErorrState(this.erorr);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSucsessState extends NewsState {}

class NewsGetScienceErorrState extends NewsState {
   final String erorr;
   NewsGetScienceErorrState(this.erorr);
}