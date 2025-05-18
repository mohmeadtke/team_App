part of 'main_page_bloc.dart';

@immutable
sealed class MainPageState {}

final class MainPageInitial extends MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageSuccsesState extends MainPageState {
  final List<TeamsEntity> data;
  MainPageSuccsesState({required this.data});
}

class MainPageFiallurState extends MainPageState {
  final String messge;
  MainPageFiallurState({required this.messge});
}
