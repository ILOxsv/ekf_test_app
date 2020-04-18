import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekf_test_app/common/helper.dart';
import 'package:ekf_test_app/data/child.dart';
import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  final Child child;
  final List<AutoSizeGroup> groups;

  const ChildCard({Key key, this.child, this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  child.surname,
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
                  child.name,
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
                  child.patronymic,
                  style: Theme.of(context).textTheme.headline2,
                  minFontSize: 8,
                  maxFontSize: 14,
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
                  Helper.month(child.birthday.month),
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
                  child.birthday.day.toString(),
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
                  child.birthday.year.toString(),
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
    );
  }
}
