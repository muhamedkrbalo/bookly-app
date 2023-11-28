import 'package:bookly_app/Features/search/presentation/view_models/search_book_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_list_view.dart';
import 'package:bookly_app/core/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value)async{
              BlocProvider.of<SearchBookCubit>(context).featchSearchBooks(title: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
}

// // class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: Text('data'),
//         );
//       },
//     );
//   }
// }