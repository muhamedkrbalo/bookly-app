
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/view_models/simila_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_detailes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, 
  required this.bookModel
  });

 final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
   BlocProvider.of<SimilarBooksCubit>(context).fetchSimilardBooks(category:widget.bookModel.volumeInfo!.categories![0] );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}