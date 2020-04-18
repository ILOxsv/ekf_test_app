import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/data/employee.dart';
import 'package:ekf_test_app/data/globalvalues.dart';
import 'package:flutter/material.dart';
import 'employeepage.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({Key key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBloc = GlobalValues.of(context).dataBloc;
    final childrenText = employee.childrenCountText();
    final size = MediaQuery.of(context).size;
    final groups = List.generate(3, (_) => AutoSizeGroup());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        dataBloc.selectedEmployee.add(employee);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmployeePage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    employee.position,
                    style: Theme.of(context).textTheme.headline1,
                    minFontSize: 8,
                    maxFontSize: 12,
                    maxLines: 1,
                    group: groups[2],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    employee.surname,
                    style: Theme.of(context).textTheme.headline3,
                    minFontSize: 12,
                    maxFontSize: 18,
                    maxLines: 1,
                    group: groups[0],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    employee.name + " " + employee.patronymic,
                    style: Theme.of(context).textTheme.headline2,
                    minFontSize: 10,
                    maxFontSize: 14,
                    maxLines: 1,
                    group: groups[1],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  employee.childrenCound != 0
                      ? AutoSizeText(
                          childrenText.elementAt(0),
                          style: Theme.of(context).textTheme.headline3,
                          minFontSize: 12,
                          maxFontSize: 18,
                          maxLines: 1,
                          group: groups[0],
                        )
                      : AutoSizeText(
                          childrenText.elementAt(0),
                          style: Theme.of(context).textTheme.headline2,
                          minFontSize: 10,
                          maxFontSize: 14,
                          maxLines: 1,
                          group: groups[1],
                        ),
                  AutoSizeText(
                    childrenText.elementAt(1),
                    style: Theme.of(context).textTheme.headline2,
                    minFontSize: 10,
                    maxFontSize: 14,
                    maxLines: 1,
                    group: groups[1],
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
