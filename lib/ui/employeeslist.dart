import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/common/mycolors.dart';
import 'package:ekf_test_app/data/employee.dart';
import 'package:ekf_test_app/data/globalvalues.dart';
import 'package:flutter/material.dart';
import 'addingpage.dart';
import 'employeecard.dart';

class EmployeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataBloc = GlobalValues.of(context).dataBloc;
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final groups = List.generate(3, (_) => AutoSizeGroup());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: padding.top + Helper.height(40, size),
          ),
          SizedBox(
            width: Helper.width(200, size),
            child: AutoSizeText(
              "Сотрудники EKF",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
              minFontSize: 12,
              maxFontSize: 24,
              maxLines: 1,
              group: GlobalValues.of(context).titlesTextGroup,
            ),
          ),
          SizedBox(
            height: Helper.height(25, size),
          ),
          Expanded(
            child: FutureBuilder<void>(
                future: dataBloc.readFromFile(),
                builder: (context, readSnapshot) {
                  if (readSnapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  return StreamBuilder<List<Employee>>(
                      stream: dataBloc.employees,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return ListView(
                          children: snapshot.data
                              .map((employee) => EmployeeCard(
                                    employee: employee,
                                    textGroups: groups,
                                  ))
                              .toList(),
                        );
                      });
                }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: Helper.width(20, size), bottom: Helper.height(40, size)),
        child: FloatingActionButton(
          backgroundColor: MyColors.BLUE,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddingPage(
                    adding: Adding.employee,
                  ))),
        ),
      ),
    );
  }
}
