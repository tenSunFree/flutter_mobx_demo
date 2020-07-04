class HomeListViewItemEntity {
  final String id;
  final String name;
  final String salary;
  final String date;
  final bool isLike;

  HomeListViewItemEntity(
      this.id, this.name, this.salary, this.date, this.isLike);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      salary.hashCode ^
      date.hashCode ^
      isLike.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeListViewItemEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          salary == other.salary &&
          date == other.date &&
          isLike == other.isLike;

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'salary': salary,
      'date': date,
      'isLike': isLike,
    };
  }

  @override
  String toString() {
    return 'TodoEntity{id: $id, name: $name, salary: $salary, date: $date, isLike: $isLike}';
  }

  static HomeListViewItemEntity fromJson(Map<String, Object> json) {
    return HomeListViewItemEntity(
      json['id'] as String,
      json['name'] as String,
      json['salary'] as String,
      json['date'] as String,
      json['isLike'] as bool,
    );
  }
}
