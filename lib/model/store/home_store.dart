import 'package:fluttermobxdemo/model/home_list_view_item_bean.dart';
import 'package:fluttermobxdemo/model/home_codec.dart';
import 'package:mobx/mobx.dart';
import '../home_list_view_item_entity.dart';
import '../../repository/data_source_repository.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore(
    this.repository, {
    ObservableList<HomeListViewItemBean> list,
    this.codec = const TodoCodec(),
    this.saveDelay = 500,
  }) : list = list ?? ObservableList<HomeListViewItemBean>();

  final TodoCodec codec;
  final DataSourceRepository repository;
  final int saveDelay;
  final ObservableList<HomeListViewItemBean> list;
  ReactionDisposer _disposeSaveReaction;

  @observable
  ObservableFuture<void> loading;

  @computed
  List<HomeListViewItemBean> get getList => list;

  Future<void> init() async {
    loading = ObservableFuture(_getList());
    await loading;
    _disposeSaveReaction = reaction<List<HomeListViewItemEntity>>(
        (_) => list.map(codec.encode).toList(growable: false),
        (entity) => repository.saveItemEntityList(entity),
        delay: saveDelay);
  }

  @action
  Future<void> _getList() async {
    final entityList = await repository.getItemEntityList();
    list.addAll(entityList.map(codec.decode).toList());
  }

  void dispose() => _disposeSaveReaction();
}
