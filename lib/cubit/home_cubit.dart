import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/cubit/home_state.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/data/news_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getArticles() async {
    emit(HomeLoading());
    final result = await ApiManager.getNews();
    switch (result) {
      case Success<NewsModel>():
        emit(HomeSuccess(result.data.articles ?? []));
      case Error<NewsModel>():
        emit(HomeError(result.error));
    }
  }
}
