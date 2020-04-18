import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/common/mycolors.dart';
import 'package:ekf_test_app/data/employee.dart';
import 'package:ekf_test_app/data/globalvalues.dart';
import 'package:ekf_test_app/ui/addingpage.dart';
import 'package:flutter/material.dart';
import 'childcard.dart';

class EmployeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataBloc = GlobalValues.of(context).dataBloc;
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final groups = List.generate(3, (_) => AutoSizeGroup());
    return Scaffold(
      body: StreamBuilder<Employee>(
          stream: dataBloc.selectedEmployee,
          builder: (context, employeeSnapshot) {
            if (!employeeSnapshot.hasData) return Container();
            final employee = employeeSnapshot.data;
            final childrenText = employee.childrenCountText();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: padding.top + Helper.height(40, size),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Helper.width(30, size)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          width: Helper.width(40, size),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: MyColors.BLACK,
                              size: Helper.width(18, size),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            width: Helper.width(200, size),
                            child: AutoSizeText(
                              "Сотрудник",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                              minFontSize: 12,
                              maxFontSize: 24,
                              maxLines: 1,
                              group: GlobalValues.of(context).titlesTextGroup,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Helper.width(40, size),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Helper.height(50, size),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Helper.width(50, size)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Helper.width(175, size),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  employee.position,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(fontSize: 14),
                                  minFontSize: 8,
                                  maxFontSize: 14,
                                  maxLines: 1,
                                  group: groups[2],
                                ),
                                SizedBox(
                                  height: Helper.height(15, size),
                                ),
                                AutoSizeText(
                                  employee.surname,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(fontSize: 24),
                                  minFontSize: 14,
                                  maxFontSize: 24,
                                  maxLines: 1,
                                  group: groups[0],
                                ),
                                SizedBox(
                                  height: Helper.height(15, size),
                                ),
                                AutoSizeText(
                                  employee.name + " " + employee.patronymic,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 18),
                                  minFontSize: 10,
                                  maxFontSize: 18,
                                  maxLines: 1,
                                  group: groups[1],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Helper.width(75, size),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AutoSizeText(
                                  Helper.month(employee.birthday.month),
                                  style: Theme.of(context).textTheme.headline1,
                                  minFontSize: 6,
                                  maxFontSize: 12,
                                  maxLines: 1,
                                  group: groups[2],
                                ),
                                SizedBox(
                                  height: Helper.height(10, size),
                                ),
                                AutoSizeText(
                                  employee.birthday.day.toString(),
                                  style: Theme.of(context).textTheme.headline3,
                                  minFontSize: 10,
                                  maxFontSize: 18,
                                  maxLines: 1,
                                  group: groups[0],
                                ),
                                SizedBox(
                                  height: Helper.height(10, size),
                                ),
                                AutoSizeText(
                                  employee.birthday.year.toString(),
                                  style: Theme.of(context).textTheme.headline2,
                                  minFontSize: 8,
                                  maxFontSize: 14,
                                  maxLines: 1,
                                  group: groups[1],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Helper.height(40, size),
                      ),
                      SizedBox(
                        height: Helper.height(30, size),
                        width: Helper.height(275, size),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Helper.width(20, size)),
                                child: Container(
                                  height: 2,
                                  color: MyColors.GREY.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Helper.width(100, size),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  employee.childrenCound != 0
                                      ? AutoSizeText(
                                          childrenText.elementAt(0) + " ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                          minFontSize: 10,
                                          maxFontSize: 18,
                                          maxLines: 1,
                                          group: groups[0],
                                        )
                                      : AutoSizeText(
                                          childrenText.elementAt(0) + " ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                          minFontSize: 8,
                                          maxFontSize: 14,
                                          maxLines: 1,
                                          group: groups[1],
                                        ),
                                  AutoSizeText(
                                    childrenText.elementAt(1),
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                    minFontSize: 8,
                                    maxFontSize: 14,
                                    maxLines: 1,
                                    group: groups[1],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Helper.width(20, size)),
                                child: Container(
                                  height: 2,
                                  color: MyColors.GREY.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  padding:
                      EdgeInsets.symmetric(vertical: Helper.height(25, size)),
                  children: employee.children
                      .map((child) => ChildCard(
                            child: child,
                            groups: groups,
                          ))
                      .toList(),
                )),
              ],
            );
          }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: Helper.width(20, size), bottom: Helper.height(40, size)),
        child: FloatingActionButton(
          backgroundColor: MyColors.BLUE,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddingPage(
                    adding: Adding.child,
                  ))),
        ),
      ),
    );
  }
}
