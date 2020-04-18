import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'databloc.dart';

class GlobalValues extends InheritedWidget {
  final dataBloc = DataBloc();

  final titlesTextGroup = AutoSizeGroup();

  GlobalValues({@required Widget child}) : super(child: child);

  static GlobalValues of(context) {
    return (context.inheritFromWidgetOfExactType(GlobalValues) as GlobalValues);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
