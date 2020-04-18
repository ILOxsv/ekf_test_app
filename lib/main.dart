import 'package:ekf_test_app/ui/employeeslist.dart';
import 'package:flutter/material.dart';
import 'common/mycolors.dart';
import 'data/globalvalues.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: MyColors.GREY,
              fontSize: 12),
          headline4: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: MyColors.BLACK,
              fontSize: 24),
          headline2: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: MyColors.BLACK,
              fontSize: 14),
          headline3: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: MyColors.BLACK,
              fontSize: 18)));

  @override
  Widget build(BuildContext context) {
    return GlobalValues(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employees Database',
        theme: theme,
        home: EmployeeList(),
      ),
    );
  }
}
