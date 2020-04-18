import 'child.dart';

class Employee {
  String name;
  String surname;
  String patronymic;
  DateTime birthday;
  String position;
  List<Child> children;

  int childrenCound = 0;

  addChild(Child child) {
    children.add(child);
    childrenCound++;
  }

  List<String> childrenCountText() {
    if (childrenCound == 0) return ["нет", "детей"];
    if (childrenCound == 1 || childrenCound != 11 && childrenCound % 10 == 1)
      return [childrenCound.toString(), "ребёнок"];
    return [childrenCound.toString(), "детей"];
  }

  Employee(
      {this.name,
      this.surname,
      this.patronymic,
      this.birthday,
      this.position}) {
    this.children = List<Child>();
  }

  Employee.fromJson(Map<String, dynamic> json) {
    this.name = json['name'] ?? "Без имени";
    this.surname = json['surname'] ?? "Без фамилиии";
    this.patronymic = json['patronymic'] ?? "";
    final birthdayText = json['birthday'];
    if (birthdayText != null && birthdayText.toString().isNotEmpty) {
      this.birthday = DateTime.parse(birthdayText);
    } else {
      this.birthday = DateTime.now();
    }
    this.position = json['position'] ?? "Без должности";
    final List<dynamic> childrenText = json['children'];
    if (childrenText != null &&
        childrenText.toString().isNotEmpty &&
        childrenText.toString() != '[]') {
      this.children = childrenText.map((text) => Child.fromJson(text)).toList();
    } else
      this.children = [];
    this.childrenCound = children.length;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'patronymic': patronymic,
        'birthday': birthday.toString(),
        'position': position,
        'children': children.map((child) => child.toJson()).toList(),
      };
}
