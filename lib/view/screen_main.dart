import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/functions/db_functions.dart';
import 'package:flutter_application_4/model/data_model.dart';
import 'package:flutter_application_4/view/add_student_widget.dart';
import 'package:flutter_application_4/view/editscreen.dart';
import 'package:flutter_application_4/view/list_student_widget.dart';
import 'package:flutter_application_4/view/screen_homelist.dart';
import 'package:flutter_application_4/widgets/common_widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_application_4/view/screen_home.dart';

import 'studentdetails.dart';

class ScreenSearchView extends StatefulWidget {
  const ScreenSearchView({super.key});

  @override
  State<ScreenSearchView> createState() => _ScreenSearchViewState();
}

TextEditingController textEditingController = TextEditingController();

class _ScreenSearchViewState extends State<ScreenSearchView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        AnimSearchBar(
          onSuffixTap: () {},
          textController: textEditingController,
          width: size.width - 80,
        ),
      ],
    );
  }
}
