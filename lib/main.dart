import 'package:flutter/material.dart';
import 'package:inherited_design_practice/adding_button.dart';
import 'package:inherited_design_practice/loading.dart';

import 'counter_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int count = 0;
  bool isLoading = false;

  void increment() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        count++;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: MyHomePageData(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CounterWidget(),
                    Text('this is a test Text'),
                    AddingButton()
                  ],
                ),
              ),
              const LoadingWidget()
            ],
          ),
          data: this,
        ));
  }
}

class MyHomePageData extends InheritedWidget {
  const MyHomePageData({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  final MyHomePageState data;

  @override
  bool updateShouldNotify(MyHomePageData oldWidget) {
    return true;
  }
}
