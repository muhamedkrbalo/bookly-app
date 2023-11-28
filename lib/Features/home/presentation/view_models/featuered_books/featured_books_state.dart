part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBoxInitial extends FeaturedBooksState {}
final class FeaturedBoxLoading extends FeaturedBooksState {}
final class FeaturedBoxSucsses extends FeaturedBooksState {
  final List<BookModel>books;

  const FeaturedBoxSucsses({required this.books});
}
final class FeaturedBoxFailure extends FeaturedBooksState {
  final String errorMassage;

  const FeaturedBoxFailure({required this.errorMassage});
}
