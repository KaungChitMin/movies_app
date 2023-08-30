import 'package:flutter/material.dart';

import '../../widgets/easy_text_widget.dart';

class MovieTypeItemView extends StatelessWidget {
  const MovieTypeItemView({super.key, required this.movieType});

  final List<String> movieType;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        children: List.generate(movieType.length, (index) {
          return ElevatedButton(
              onPressed: () {},
              child: EasyText(
                text: movieType[index],
              ));
        }));
  }
}
