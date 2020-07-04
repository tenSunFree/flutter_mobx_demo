import 'dart:async';

import 'package:fluttermobxdemo/model/home_list_view_item_entity.dart';
import 'package:fluttermobxdemo/repository/data_source_repository.dart';

class RemoteDataSource implements DataSourceRepository {
  final Duration delay;

  const RemoteDataSource([this.delay = const Duration(milliseconds: 5000)]);

  @override
  Future<List<HomeListViewItemEntity>> getItemEntityList() async {
    return Future.delayed(
        delay,
        () => [
              HomeListViewItemEntity(
                  '0', 'Cutaway 卡個位', '45K ~ 70K TWD/月', '4天前', true),
              HomeListViewItemEntity(
                  '1', 'STARLUX Airlines', '4天前', '40K ~ 60K TWD/月', false),
              HomeListViewItemEntity(
                  '2', '台灣雲海科技有限公司', '70K ~ 80K TWD/月', '4天前', true),
              HomeListViewItemEntity(
                  '3', '未來人材網路股份有限公司', '70K ~ 130K TWD/月', '5天前', false),
              HomeListViewItemEntity(
                  '4', 'PicCollage 拼貼趣', '900K ~ 1.4M TWD/年', '5天前', true),
              HomeListViewItemEntity(
                  '5', 'OpenNet 開網有限公司', '650K ~ 1.5M TWD/年', '1天前', false),
              HomeListViewItemEntity(
                  '6', '恆富國際有限公司', '60K ~ 130K TWD/月', '4天前', true),
              HomeListViewItemEntity(
                  '7', '凱納股份有限公司', '42K ~ 60K TWD/月', '4天前', false)
            ]);
  }

  @override
  Future<bool> saveItemEntityList(List<HomeListViewItemEntity> todos) async =>
      Future.value(true);
}
