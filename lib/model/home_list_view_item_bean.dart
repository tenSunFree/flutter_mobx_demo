import 'package:mobx/mobx.dart';
import '../common/uuid.dart';

part 'home_list_view_item_bean.g.dart';

class HomeListViewItemBean = _HomeListViewItemBean with _$HomeListViewItemBean;

abstract class _HomeListViewItemBean with Store {
  _HomeListViewItemBean(
      {String id,
      this.name = '',
      this.salary = '',
      this.date = '',
      this.isLike = false})
      : id = id ?? Uuid().generateV4();

  final String id;

  @observable
  String name;

  @observable
  String salary;

  @observable
  String date;

  @observable
  bool isLike;

  @override
  String toString() {
    return '_Todo{id: $id, name: $name, salary: $salary, date: $date, isLike: $isLike}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _HomeListViewItemBean &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          salary == other.salary &&
          date == other.date &&
          isLike == other.isLike;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      salary.hashCode ^
      date.hashCode ^
      isLike.hashCode;
}
