import 'package:flutter/cupertino.dart';

import 'main.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final MyHomePageState? state = context.dependOnInheritedWidgetOfExactType<MyHomePageData>()?.data;
    final int count = state?.count ?? 0;

    return Center(
      child: Text(count.toString()),
    );
  }

  
}