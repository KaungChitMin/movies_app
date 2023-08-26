import 'package:flutter/material.dart';
import 'package:movies_database/utils/bloc_extension_utils.dart';

import '../../constant/strings.dart';
import '../../widgets/easy_text_widget.dart';


class BackButtonItemView extends StatelessWidget {
  const BackButtonItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: (){
          context.navigateBack( context);
        },
        icon: const Icon(Icons.backspace_rounded),
        label:const EasyText(
          text: kBackText,
        ));
  }
}
