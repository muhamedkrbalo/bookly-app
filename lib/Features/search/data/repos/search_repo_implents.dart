import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplemnt extends SearchRepo{
    final ApiService apiService;

  SearchRepoImplemnt({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchbooks({required String title})async {
    try {
  var data= await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:$title&sorting=relevance');
  List<BookModel> books =[];
  for (var item in data['items']) {
   books.add(BookModel.fromJson(item)); 
  }
  return right(books);
} catch (e) {
  if(e is DioException){
    return  left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure( e.toString()));
  
}
  }

  }
