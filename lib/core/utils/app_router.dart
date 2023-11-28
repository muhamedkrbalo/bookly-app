import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implents.dart';
import 'package:bookly_app/Features/home/presentation/view_models/simila_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_detailes_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_implents.dart';
import 'package:bookly_app/Features/search/presentation/view_models/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) =>  BlocProvider(
          create: (context) => SearchBookCubit(SearchRepoImplemnt(apiService: ApiService(Dio()))),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kBookDetailsView,
          builder: (context, state) => BlocProvider(
                create: (context) => SimilarBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                ),
                child: BookDetailsView(
                  bookModel: state.extra as BookModel,
                ),
              )),
    ],
  );
}
