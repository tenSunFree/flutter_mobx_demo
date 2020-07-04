import 'package:flutter/material.dart';
import 'package:fluttermobxdemo/model/home_list_view_item_entity.dart';
import 'package:fluttermobxdemo/repository/data_source_repository.dart';
import 'package:fluttermobxdemo/repository/remote_data_source.dart';

class DataSourceRepositoryImp implements DataSourceRepository {
  final DataSourceRepository localDataSource;
  final DataSourceRepository remoteDataSource;

  const DataSourceRepositoryImp({
    @required this.localDataSource,
    this.remoteDataSource = const RemoteDataSource(),
  });

  @override
  Future<List<HomeListViewItemEntity>> getItemEntityList() async {
    try {
      return await localDataSource.getItemEntityList();
    } catch (_) {
      final list = await remoteDataSource.getItemEntityList();
      await localDataSource.saveItemEntityList(list);
      return list;
    }
  }

  @override
  Future saveItemEntityList(List<HomeListViewItemEntity> list) {
    return Future.wait<dynamic>([
      localDataSource.saveItemEntityList(list),
      remoteDataSource.saveItemEntityList(list),
    ]);
  }
}
