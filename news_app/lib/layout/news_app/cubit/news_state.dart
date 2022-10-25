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
