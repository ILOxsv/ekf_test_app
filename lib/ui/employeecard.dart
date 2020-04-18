import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/data/employee.dart';
import 'package:ekf_test_app/data/globalvalues.dart';
import 'package:flutter/material.dart';
import 'employeepage.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final List<AutoSizeGroup> textGroups;
  const EmployeeCard({Key key, this.employee, this.textGroups})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBloc = GlobalValues.of(context).dataBloc;
    final childrenText = employee.childrenCountText();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        dataBloc.selectedEmployee.add(employee);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmployeePage()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Helper.width(50, size),
            vertical: Helper.height(25, size)),
        child: Row(
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
                    style: Theme.of(context).textTheme.headline1,
                    minFontSize: 6,
                    maxFontSize: 12,
                    maxLines: 1,
                    group: textGroups[2],
                  ),
                  SizedBox(
                    height: Helper.height(10, size),
                  ),
                  SizedBox(
                    width: Helper.width(125, size),
                    child: AutoSizeText(
                      employee.surname,
                      style: Theme.of(context).textTheme.headline3,
                      minFontSize: 10,
                      maxFontSize: 18,
                      maxLines: 1,
                      group: textGroups[0],
                    ),
                  ),
                  SizedBox(
                    height: Helper.height(10, size),
                  ),
                  AutoSizeText(
                    employee.name + " " + employee.patronymic,
                    style: Theme.of(context).textTheme.headline2,
                    minFontSize: 8,
                    maxFontSize: 14,
                    maxLines: 1,
                    group: textGroups[1],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Helper.height(75, size),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  employee.childrenCound != 0
                      ? AutoSizeText(
                          childrenText.elementAt(0),
                          style: Theme.of(context).textTheme.headline3,
                          minFontSize: 10,
                          maxFontSize: 18,
                          maxLines: 1,
                          group: textGroups[0],
                        )
                      : AutoSizeText(
                          childrenText.elementAt(0),
                          style: Theme.of(context).textTheme.headline2,
                          minFontSize: 8,
                          maxFontSize: 14,
                          maxLines: 1,
                          group: textGroups[1],
                        ),
                  AutoSizeText(
                    childrenText.elementAt(1),
                    style: Theme.of(context).textTheme.headline2,
                    minFontSize: 8,
                    maxFontSize: 14,
                    maxLines: 1,
                    group: textGroups[1],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
