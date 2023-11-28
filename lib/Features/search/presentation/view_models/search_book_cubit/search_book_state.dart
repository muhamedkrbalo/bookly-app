part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBookInitial extends SearchBookState {}
final class SearchBookLoadig extends SearchBookState {}
final class SearchBookSucsses extends SearchBookState {
  final List<BookModel>bookModel;

  const SearchBookSucsses({required this.bookModel});
}
final class SearchBookFailure extends SearchBookState {
 final String errorMassage;

  const SearchBookFailure({required this.errorMassage});
}
