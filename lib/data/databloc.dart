import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'child.dart';
import 'employee.dart';
import 'package:flutter/services.dart' show rootBundle;

class DataBloc {
  final employees = BehaviorSubject.seeded(List<Employee>());
  final selectedEmployee = BehaviorSubject<Employee>();

  bool shouldWrite = true;

  DataBloc() {
    employees.listen((newList) {
      if (newList.isNotEmpty) {
        if (shouldWrite)
          writeToFile();
        else
          shouldWrite = true;
      }
    });
  }

  writeToFile() async {
    // print("Write to file");
    final text = jsonEncode(
        employees.value.map((employee) => employee.toJson()).toList());
    final filePath =
        (await getApplicationDocumentsDirectory()).path + "/data.json";
    final file = File(filePath);
    await file.writeAsString("{ \"employees\" : $text }");
  }

  readFromFile() async {
    if (employees.value.isEmpty) {
      print("Read from file");
      final filePath =
          (await getApplicationDocumentsDirectory()).path + "/data.json";
      final file = File(filePath);
      final fileExists = await file.exists();
      var result = "";
      try {
        if (fileExists) {
          result = await file.readAsString();
        }
        if (result == null || result.isEmpty) {
          result = await rootBundle.loadString("assets/example_data.json");
        }
      } catch (err) {}
      if (result != null && result.isNotEmpty) {
        try {
          final List<dynamic> json = jsonDecode(result)['employees'];
          final list = json.map((text) => Employee.fromJson(text)).toList();
          shouldWrite = false;
          employees.add(list);
        } catch (err) {
          print("JSON parse error: " + err.toString());
        }
      } else
        print("Empty file");
    }
  }

  addEmployee(Employee employee) {
    print("Add employee");
    employees.add(employees.value..add(employee));
  }

  addChild(Child child) {
    print("Add child");
    if (selectedEmployee.value != null)
      selectedEmployee.add(selectedEmployee.value..addChild(child));
    employees.add(employees.value);
  }

  close() {
    employees.close();
    selectedEmployee.close();
  }
}
