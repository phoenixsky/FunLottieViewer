import 'package:flutter/material.dart';

import 'drag_file_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android String Utils',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'drag your files to left or right'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DragFileWidget(
              dragFileWidgetBuilder: (context, list) => ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => Text(list[index].path),
                  )),
          const Divider(height: 5, indent: 2, color: Colors.blue),
          DragFileWidget(
              dragFileWidgetBuilder: (context, list) => ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) => Text(list[index].path),
                  ))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
