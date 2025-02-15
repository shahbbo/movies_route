// import 'package:bloc/bloc.dart';
// import 'package:flutter_projects/features/profile_tab/history/logic/cubit/history_state.dart';
//
// import '../repository/history_repository.dart';
//
// class HistoryMoviesCubit extends Cubit<HistoryState>{
//   final HistoryRepository repository;
//
//   HistoryMoviesCubit (this.repository) : super (HistoryInitial());
//
//   Future<void> getHistory()async{
//     try{
//       emit(HistoryLoading());
//      final List<String> historyList = await repository.getMovieFromHistory();
//      emit(HistorySuccess(historyList: historyList));
//     }catch (e){
//       emit(HistoryError('"Failed to load history"'));
//     }
//   }
//
//   Future<void> addToHistory(String movieName) async {
//     try {
//       await repository.addMovieToHistory(movieName);
//       getHistory();
//     } catch (e) {
//       emit(HistoryError("Failed to add movie"));
//     }
//   }


//}