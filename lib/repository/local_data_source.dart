import 'dart:async';
import 'dart:convert';
import 'package:fluttermobxdemo/model/home_list_view_item_entity.dart';
import 'package:fluttermobxdemo/repository/data_source_repository.dart';
import 'package:key_value_store/key_value_store.dart';

class LocalDataSource implements DataSourceRepository {
  final String key;
  final KeyValueStore store;
  final JsonCodec codec;

  const LocalDataSource(this.key, this.store, [this.codec = json]);

  @override
  Future<List<HomeListViewItemEntity>> getItemEntityList() async {
    return codec
        .decode(store.getString(key))['itemEntityList']
        .cast<Map<String, Object>>()
        .map<HomeListViewItemEntity>(HomeListViewItemEntity.fromJson)
        .toList(growable: false);
  }

  @override
  Future<bool> saveItemEntityList(List<HomeListViewItemEntity> list) {
    return store.setString(
        key,
        codec.encode(
            {'itemEntityList': list.map((todo) => todo.toJson()).toList()}));
  }
}
