import 'package:bookly_app/Features/home/data/repos/home_repo_implents.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServerLocater(){
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: ApiService(Dio())));
}