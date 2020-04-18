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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: padding.top + 20,
          ),
          Text(
            "Сотрудники EKF",
            style: Theme.of(context).textTheme.headline4,
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
                              .map((employee) =>
                                  EmployeeCard(employee: employee))
                              .toList(),
                        );
                      });
                }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 40),
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
