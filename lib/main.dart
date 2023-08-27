import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_database/pages/home_page.dart';
import 'constant/hive_constant.dart';
import 'constant/strings.dart';
import 'data/vos/genre_vo/genre_vo.dart';
import 'data/vos/movie_vo/movie_vo.dart';
import 'data/vos/movies_details_vo/movie_details_vo.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieDetailsVOAdapter());

  await Hive.openBox<MovieVO>(kBoxNameForMovieVO);
  await Hive.openBox<GenreVO>(kBoxNameForGenreVO);
  await Hive.openBox<String>(kBoxNameForSearchHistoryVO);
  await Hive.openBox<MovieDetailsVO>(kBoxNameForActorDetailsVO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      home: HomePage(),
    );
  }
}
