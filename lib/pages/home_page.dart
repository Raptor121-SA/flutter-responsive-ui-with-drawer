import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui_template/constants/page_titles.dart';
import 'package:flutter_responsive_ui_template/widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.home,
      body: Center(
        child: Text(
          'This is the home page',
        ),
      ),
    );
  }
}
