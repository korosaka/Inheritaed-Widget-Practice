

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class LoadingWidget extends StatelessWidget {

  const LoadingWidget({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyHomePageState? state = context.dependOnInheritedWidgetOfExactType<MyHomePageData>()?.data;
    final bool isLoading = state?.isLoading ?? false;
    return Center(
      child: isLoading ? const CircularProgressIndicator() : Container()
    );
  }


}