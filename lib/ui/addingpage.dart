import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/common/mycolors.dart';
import 'package:ekf_test_app/data/child.dart';
import 'package:ekf_test_app/data/employee.dart';
import 'package:ekf_test_app/data/globalvalues.dart';
import 'package:ekf_test_app/ui/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'button.dart';

enum Adding { employee, child }

class AddingPage extends StatefulWidget {
  final Adding adding;

  const AddingPage({Key key, this.adding}) : assert(adding != null);

  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  bool canSave;

  Function() validator;
  Function() dateValidator;

  TextEditingController nameController;
  TextEditingController surnameController;
  TextEditingController patronymicController;
  TextEditingController positionController;
  TextEditingController birthdayController;

  FocusNode nameFocus;
  FocusNode surnameFocus;
  FocusNode patronymicFocus;
  FocusNode positionFocus;
  FocusNode birthdayFocus;

  DateTime now;
  DateTime birthday;

  @override
  void initState() {
    canSave = false;

    validator = checkTexts;
    dateValidator = checkBirthDayString;

    nameController = TextEditingController()..addListener(validator);
    surnameController = TextEditingController()..addListener(validator);
    patronymicController = TextEditingController();
    positionController = TextEditingController()..addListener(validator);
    birthdayController = TextEditingController()..addListener(dateValidator);

    nameFocus = FocusNode();
    surnameFocus = FocusNode();
    patronymicFocus = FocusNode();
    positionFocus = FocusNode();
    birthdayFocus = FocusNode();

    now = DateTime.now();

    super.initState();
  }

  @override
  dispose() {
    nameController.removeListener(validator);
    surnameController.removeListener(validator);
    positionController.removeListener(validator);
    birthdayController.removeListener(dateValidator);

    nameController.dispose();
    surnameController.dispose();
    patronymicController.dispose();
    positionController.dispose();
    birthdayController.dispose();

    nameFocus.dispose();
    surnameFocus.dispose();
    patronymicFocus.dispose();
    positionFocus.dispose();
    birthdayFocus.dispose();

    super.dispose();
  }

  title() {
    switch (widget.adding) {
      case Adding.employee:
        return "Новый сотрудник";
      case Adding.child:
        return "Новый ребёнок";
    }
  }

  updateDate(newDate) {
    if (newDate != null) {
      birthday = newDate;
      final newText = DateFormat("dd.MM.yyyy").format(newDate);
      birthdayController.text = newText;
    }
  }

  checkBirthDayString() {
    final birthdayText = birthdayController.text;
    if (birthdayText == null || birthdayText.isEmpty) {
      birthday = null;
      checkTexts();
      return;
    }
    final matchesDots =
        RegExp(r"^\d{1,2}\.\d{1,2}\.\d{4}$").hasMatch(birthdayText);
    final matchesSlashes =
        RegExp(r"^\d{1,2}\/\d{1,2}\/\d{4}$").hasMatch(birthdayText);
    if (!matchesDots && !matchesSlashes) {
      birthday = null;
      checkTexts();
      return;
    }
    final array = birthdayText
        .split(matchesSlashes ? "/" : ".")
        .map((numText) => int.parse(numText))
        .toList();
    try {
      final day = array[0];
      final month = array[1];
      final year = array[2];
      if (day == 0 ||
          day > 31 ||
          month == 0 ||
          month > 12 ||
          year < 1900 ||
          year > 2020) {
        birthday = null;
        checkTexts();
        return;
      }
      final newDate = DateTime(year, month, day);
      birthday = newDate;
      checkTexts();
    } catch (err) {
      print(err.toString());
    }
  }

  clear() {
    nameController.clear();
    surnameController.clear();
    patronymicController.clear();
    positionController.clear();
    birthdayController.clear();
  }

  checkTexts() {
    final name = nameController.text;
    final surname = surnameController.text;
    final position = positionController.text;
    bool newCanSave = false;
    switch (widget.adding) {
      case Adding.employee:
        newCanSave = name.isNotEmpty &&
            surname.isNotEmpty &&
            position.isNotEmpty &&
            birthday != null;
        break;
      case Adding.child:
        newCanSave = name.isNotEmpty && surname.isNotEmpty && birthday != null;
        break;
    }
    setState(() {
      canSave = newCanSave;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataBloc = GlobalValues.of(context).dataBloc;
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    final buttonsTextGroup = AutoSizeGroup();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: padding.top + Helper.height(40, size),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Helper.width(30, size)),
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
                        title(),
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
            height: Helper.height(25, size),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: Helper.height(25, size)),
              children: [
                CustomTextField(
                  controller: surnameController,
                  label: "Фамилия",
                  hint: "Иванов",
                  focus: surnameFocus,
                  onSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(nameFocus),
                ),
                CustomTextField(
                  controller: nameController,
                  label: "Имя",
                  hint: "Сергей",
                  focus: nameFocus,
                  onSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(patronymicFocus),
                ),
                CustomTextField(
                  controller: patronymicController,
                  label: "Отчество",
                  hint: "Андреевич",
                  focus: patronymicFocus,
                  onSubmitted: (_) => FocusScope.of(context).requestFocus(
                      widget.adding == Adding.employee
                          ? positionFocus
                          : birthdayFocus),
                ),
                widget.adding == Adding.employee
                    ? CustomTextField(
                        controller: positionController,
                        label: "Должность",
                        hint: "Менеджер по продажам",
                        focus: positionFocus,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(birthdayFocus),
                        textCapitalization: TextCapitalization.sentences,
                      )
                    : SizedBox(),
                CustomTextField(
                  controller: birthdayController,
                  label: "День рождения",
                  hint: "17.11.1982 или 15/08/2003",
                  focus: birthdayFocus,
                  onSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(nameFocus),
                  suffix: GestureDetector(
                      onTap: () => {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime(
                                        now.year - 30, now.month, now.day),
                                    firstDate: DateTime(
                                        now.year - 100, now.month, now.day),
                                    lastDate: now)
                                .then((newDate) => updateDate(newDate))
                          },
                      child: Icon(
                        Icons.calendar_today,
                        color: MyColors.GREY.withOpacity(0.8),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Helper.width(50, size),
                      vertical: Helper.height(25, size)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          clear();
                        },
                        child:
                            Button(type: Type.clear, group: buttonsTextGroup),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (canSave) {
                            switch (widget.adding) {
                              case Adding.employee:
                                final newEmployee = Employee(
                                    name: nameController.text,
                                    surname: surnameController.text,
                                    patronymic: patronymicController.text,
                                    position: positionController.text,
                                    birthday: birthday);
                                dataBloc.addEmployee(newEmployee);
                                Navigator.of(context).pop();
                                break;
                              case Adding.child:
                                final newChild = Child(
                                    name: nameController.text,
                                    surname: surnameController.text,
                                    patronymic: patronymicController.text,
                                    birthday: birthday);
                                dataBloc.addChild(newChild);
                                Navigator.of(context).pop();
                                break;
                            }
                          }
                        },
                        child: Button(
                            type: Type.save,
                            enabled: canSave,
                            group: buttonsTextGroup),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
