
import 'package:bookly_app/Features/home/data/repos/home_repo_implents.dart';
import 'package:bookly_app/Features/home/presentation/view_models/featuered_books/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServerLocater();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks()),
        BlocProvider(create: (context)=>NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewesdBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    );
  }
}

