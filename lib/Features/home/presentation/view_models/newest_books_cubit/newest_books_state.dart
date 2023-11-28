part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksSucsses extends NewestBooksState {
    final List<BookModel>books;

  const NewestBooksSucsses({required this.books});

}
final class NewestBooksFailure extends NewestBooksState {
    final String errorMassage;

  const NewestBooksFailure({required this.errorMassage});

}
