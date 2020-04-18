class Child {
  String name;
  String surname;
  String patronymic;
  DateTime birthday;

  Child({this.name, this.surname, this.patronymic, this.birthday});

  Child.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.surname = json['surname'];
    this.patronymic = json['patronymic'];
    final birthdayText = json['birthday'];
    if (birthdayText != null && birthdayText.toString().isNotEmpty) {
      this.birthday = DateTime.parse(birthdayText);
    } else {
      this.birthday = DateTime.now();
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'surname': surname,
        'patronymic': patronymic,
        'birthday': birthday.toString(),
      };
}
