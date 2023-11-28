
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());
  final SearchRepo searchRepo;

  Future<void>featchSearchBooks({required String title})async{
    emit(SearchBookLoadig());
   var result=await searchRepo.fetchSearchbooks(title: title);
    result.fold((failure) {
      emit(SearchBookFailure(errorMassage: failure.errMessage));
     }, (books) {
      emit(SearchBookSucsses(bookModel: books));
     });   

  }

}
