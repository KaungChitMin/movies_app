import 'package:flutter/material.dart';
import 'package:movies_database/bloc/details_page_bloc.dart';
import 'package:movies_database/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/search_page_bloc.dart';

extension BlocExtension on BuildContext {
  SearchPageBloc getSearchPageBlocInstance() => read<SearchPageBloc>();

  HomePageBloc getHomePageBlocInstance()=> read<HomePageBloc>();

  DetailsPageBLoc getDetailsPageBloc()=> read()<DetailsPageBLoc>();

  Future navigateToNextScreen(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => nextScreen));

  void navigateBack(BuildContext context) => Navigator.of(context).pop();
}

extension StringExtensions on String {
  String addS() {
    if (length <= 1) {
      return this;
    }
    return '${this}s';
  }
}
