import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobxdemo/common/key.dart';
import 'package:fluttermobxdemo/model/store/home_store.dart';
import 'package:provider/provider.dart';
import '../model/home_list_view_item_bean.dart';

class HomeListView extends StatelessWidget {
  final void Function(BuildContext context, HomeListViewItemBean bean) onRemove;

  HomeListView({Key key, @required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final list = Provider.of<HomeStore>(context).list;
      return ListView.builder(
          padding: const EdgeInsets.all(0.0),
          key: AppKey.homeListViewKey,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final todo = list[index];
            return Dismissible(
                key: AppKey.homeListViewItemKey(todo.id),
                onDismissed: (_) => onRemove(context, todo),
                child: Column(children: <Widget>[
                  SizedBox(height: 16),
                  Row(children: <Widget>[
                    SizedBox(width: 16),
                    Text(todo.name,
                        style: TextStyle(color: Colors.black, fontSize: 18.0)),
                    Expanded(flex: 1, child: SizedBox()),
                    Observer(
                        builder: (_) => InkWell(
                            onTap: () {
                              todo.isLike = !todo.isLike;
                            },
                            child: Image.asset(
                                todo.isLike
                                    ? 'assets/icon_like.png'
                                    : 'assets/icon_dislike.png',
                                key: AppKey.homeLikeKey(todo.id),
                                width: 33,
                                height: 30))),
                    SizedBox(width: 16)
                  ]),
                  SizedBox(height: 16),
                  Row(children: <Widget>[
                    SizedBox(width: 16),
                    Text(todo.salary,
                        style: TextStyle(
                            color: Color(0xFFE86200), fontSize: 15.0)),
                    Expanded(flex: 1, child: SizedBox()),
                    Text(todo.date,
                        style: TextStyle(
                            color: Color(0xFF8C8C8C), fontSize: 15.0)),
                    SizedBox(width: 16)
                  ]),
                  SizedBox(height: 16),
                  Container(color: Color(0xFFE4E4E4), height: 1)
                ]));
          });
    });
  }
}
