import 'package:flutter/material.dart';
import 'package:fluttermobxdemo/common/app.dart';
import 'package:fluttermobxdemo/common/key.dart';
import 'package:fluttermobxdemo/repository/data_source_repository_imp.dart';
import 'package:fluttermobxdemo/repository/local_data_source.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
      repository: DataSourceRepositoryImp(
          localDataSource: LocalDataSource(AppKey.localDataSourceKey,
              FlutterKeyValueStore(await SharedPreferences.getInstance())))));
}
