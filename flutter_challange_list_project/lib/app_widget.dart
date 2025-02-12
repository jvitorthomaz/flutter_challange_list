import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challange_list_project/core/app_nav_global_key.dart';
import 'package:flutter_challange_list_project/core/ui/app_theme.dart';


class AppWidget extends StatelessWidget {

  const AppWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      builder: (AsyncNavigatorObserver){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App',
          theme: AppTheme.themeData,

          navigatorObservers: [AsyncNavigatorObserver],
          navigatorKey: AppNavGlobalKey.instance.navKey,

          routes: {

            //'/home': (_) => const ListMotelsPage(),

            
          },

        );
      }
    );
  }
}
