import 'package:flutter/widgets.dart';
import 'databloc.dart';

class GlobalValues extends InheritedWidget {
  final dataBloc = DataBloc();

  GlobalValues({@required Widget child}) : super(child: child);

  static GlobalValues of(context) {
    return (context.inheritFromWidgetOfExactType(GlobalValues) as GlobalValues);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
