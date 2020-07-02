import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui_template/widgets/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String pageTitle;

  const AppScaffold({Key key, @required this.body, @required this.pageTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;

    return Row(
      children: [
        if (!displayMobileLayout)
          AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: displayMobileLayout,
              title: Text(pageTitle),
            ),
            drawer: displayMobileLayout
                ? AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: body,
          ),
        ),
      ],
    );
  }
}
