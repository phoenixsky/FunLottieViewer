import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

typedef DragFileWidgetBuilder = Widget Function(
    BuildContext context, List<XFile> list);

class DragFileWidget extends StatefulWidget {
  final Widget? empty;
  final DragFileWidgetBuilder dragFileWidgetBuilder;

  const DragFileWidget(
      {Key? key, this.empty, required this.dragFileWidgetBuilder})
      : super(key: key);

  @override
  _DragFileWidgetState createState() => _DragFileWidgetState();
}

class _DragFileWidgetState extends State<DragFileWidget> {
  final List<XFile> _list = [];

  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        setState(() {
          _list.addAll(detail.files);
        });
      },
      onDragEntered: (detail) {
        setState(() {
          _dragging = true;
        });
      },
      onDragExited: (detail) {
        setState(() {
          _dragging = false;
        });
      },
      child: Expanded(
        child: Container(
          height: double.infinity,
          color: _dragging ? Colors.blue.withOpacity(0.4) : Colors.black26,
          child: _list.isEmpty
              ? Center(child: widget.empty ?? const Text("Drop here"))
              : widget.dragFileWidgetBuilder(context, _list),
        ),
      ),
    );
  }
}
