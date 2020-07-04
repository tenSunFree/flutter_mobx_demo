import 'package:flutter/widgets.dart';

class AppKey {
  static const localDataSourceKey = 'localDataSourceKey';
  static const homeLoadingKey = Key('homeLoading');
  static const snackBarKey = Key('snackBarKey');

  static Key snackBarActionKey(String id) => Key('snackBarActionKey$id');
  static const homeListViewKey = Key('homeListViewKey');
  static final homeListViewItemKey =
      (String id) => Key('homeListViewItemKey$id');
  static final homeLikeKey = (String id) => Key('homeLikeKey$id');
}
