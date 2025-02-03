part of 'app_cubit.dart';

sealed class AppState {}
final class AppInitial extends AppState {}
final class ChangeLocalState extends AppState {}
final class AppBottomNavigationBarIndexChange extends AppState {}
