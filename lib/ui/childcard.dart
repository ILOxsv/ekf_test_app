import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/data/child.dart';
import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  final Child child;

  const ChildCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final groups = List.generate(3, (_) => AutoSizeGroup());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  child.surname,
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
                  child.name,
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
                  child.patronymic,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  Helper.month(child.birthday.month),
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
                  child.birthday.day.toString(),
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
                  child.birthday.year.toString(),
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
    );
  }
}
