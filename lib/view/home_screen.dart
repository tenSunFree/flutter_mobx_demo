import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobxdemo/common/key.dart';
import 'package:fluttermobxdemo/model/home_list_view_item_bean.dart';
import 'package:fluttermobxdemo/model/store/home_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'home_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(children: <Widget>[
              Image.asset('assets/icon_top_bar.png'),
              buildContentExpanded(),
              Image.asset('assets/icon_bottom_bar.png'),
            ])));
  }

  Expanded buildContentExpanded() {
    return Expanded(
        flex: 1,
        child: Observer(builder: (context) {
          final store = Provider.of<HomeStore>(context);
          if (store.loading.status == FutureStatus.pending) {
            return Center(
                child: CircularProgressIndicator(key: AppKey.homeLoadingKey));
          }
          return HomeListView(onRemove: (context, bean) {
            store.list.remove(bean);
            _displayRemovalNotification(context, bean);
          });
        }));
  }

  void _displayRemovalNotification(
      BuildContext context, HomeListViewItemBean bean) {
    Scaffold.of(context).showSnackBar(SnackBar(
        key: AppKey.snackBarKey,
        duration: const Duration(seconds: 3),
        content: Text('已刪除 ${bean.name}',
            maxLines: 1, overflow: TextOverflow.ellipsis),
        action: SnackBarAction(
            key: AppKey.snackBarActionKey(bean.id),
            label: '還原',
            onPressed: () {
              Provider.of<HomeStore>(context, listen: false).list.add(bean);
            })));
  }
}
