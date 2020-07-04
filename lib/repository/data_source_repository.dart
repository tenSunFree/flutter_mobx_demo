import 'dart:async';
import 'dart:core';
import '../model/home_list_view_item_entity.dart';

abstract class DataSourceRepository {
  Future<List<HomeListViewItemEntity>> getItemEntityList();

  Future saveItemEntityList(List<HomeListViewItemEntity> list);
}
