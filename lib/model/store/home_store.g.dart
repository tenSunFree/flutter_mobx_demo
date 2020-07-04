// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<List<HomeListViewItemBean>> _$getListComputed;

  @override
  List<HomeListViewItemBean> get getList => (_$getListComputed ??=
          Computed<List<HomeListViewItemBean>>(() => super.getList))
      .value;

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

  @override
  ObservableFuture<void> get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(ObservableFuture<void> value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$_getListAsyncAction = AsyncAction('_getList');

  @override
  Future<void> _getList() {
    return _$_getListAsyncAction.run(() => super._getList());
  }
}
