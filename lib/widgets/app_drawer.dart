import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui_template/constants/page_titles.dart';
import 'package:flutter_responsive_ui_template/constants/route_names.dart';
import 'package:flutter_responsive_ui_template/helpers/app_route_observer.dart';

class AppDrawer extends StatefulWidget {
  final bool permanentlyDisplay;

  AppDrawer({@required this.permanentlyDisplay, Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  child: Text('Drawer'),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(PageTitles.home),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.home);
                  },
                  selected: _selectedRoute == RouteNames.home,
                ),
              ],
            ),
          ),
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            ),
        ],
      ),
    );
  }

  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}
