import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermobxdemo/common/routes.dart';
import 'package:fluttermobxdemo/common/theme.dart';
import 'package:fluttermobxdemo/model/store/home_store.dart';
import 'package:fluttermobxdemo/repository/data_source_repository.dart';
import 'package:fluttermobxdemo/view/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final DataSourceRepository repository;

  const App({Key key, @required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomeStore>(
      create: (_) => HomeStore(repository)..init(),
      dispose: (_, store) => store.dispose(),
      child: MaterialApp(
        initialRoute: Routes.home,
        theme: ArchSampleTheme.theme,
        routes: {Routes.home: (context) => HomeScreen()},
      ),
    );
  }
}
