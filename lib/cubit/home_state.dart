import 'package:news_app/data/news_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Article> articles;
  HomeSuccess(this.articles);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
