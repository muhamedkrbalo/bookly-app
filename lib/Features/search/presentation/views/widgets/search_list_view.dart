import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/view_models/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
      if(state is SearchBookSucsses){
          return ListView.builder(
         // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.bookModel.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(
                  bookModel: state.bookModel[index],
                  ),
            );
          },
        );
    
      }else if(state is SearchBookFailure){
        return CustomErrorWidget(errMessage: state.errorMassage);
      }
      // else if(state is SearchBookLoadig){
      
      //   return const CustomLoadingIndicator();
      // }
      else{
        return const Center(child: Text(''));
      }
     
        },
    );
  }
}
