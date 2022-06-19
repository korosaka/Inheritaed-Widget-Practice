import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddingButton extends StatelessWidget {
  const AddingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyHomePageState? state =
        context.dependOnInheritedWidgetOfExactType<MyHomePageData>()?.data;

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state?.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
