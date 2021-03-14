import 'package:flutter/material.dart';

class AppStore extends StatefulWidget {
  final Widget child;

  AppStore({@required this.child});

  @override
  State<StatefulWidget> createState() => _AppStoreState();

  static _AppStoreState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_InheritedAppState>().data;
}

class _AppStoreState extends State<AppStore> {
  String tesData1 = 'Test Data 1';
  String tesData2 = 'Test Data 2';
  String tesData3 = 'Test Data 3';

  @override
  Widget build(BuildContext context) {
    return _InheritedAppState(child: widget.child, data: this);
  }
}

class _InheritedAppState extends InheritedWidget {
  final _AppStoreState data;

  _InheritedAppState({@required Widget child, @required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
