import 'dart:convert';
import 'home_list_view_item_entity.dart';
import 'home_list_view_item_bean.dart';

class TodoCodec extends Codec<HomeListViewItemBean, HomeListViewItemEntity> {
  const TodoCodec();

  @override
  Converter<HomeListViewItemEntity, HomeListViewItemBean> get decoder =>
      const _TodoDecoder();

  @override
  Converter<HomeListViewItemBean, HomeListViewItemEntity> get encoder =>
      const _TodoEncoder();
}

class _TodoEncoder
    extends Converter<HomeListViewItemBean, HomeListViewItemEntity> {
  const _TodoEncoder();

  @override
  HomeListViewItemEntity convert(HomeListViewItemBean todo) =>
      HomeListViewItemEntity(
          todo.id, todo.name, todo.salary, todo.date, todo.isLike);
}

class _TodoDecoder
    extends Converter<HomeListViewItemEntity, HomeListViewItemBean> {
  const _TodoDecoder();

  @override
  HomeListViewItemBean convert(HomeListViewItemEntity entity) =>
      HomeListViewItemBean(
          id: entity.id,
          name: entity.name,
          salary: entity.salary,
          date: entity.date,
          isLike: entity.isLike ?? false);
}
