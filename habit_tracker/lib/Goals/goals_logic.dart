import 'package:habit_tracker/InfoGoal/infoGoal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database.dart';
import '../EditGoals/editGoals.dart';
import '../InfoGoal/infoGoal.dart';

Future<List<Goal>> createListViewGoals() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  List<Goal> goals = await helper.queryAllGoals();
  if (goals == null) {
    print('ListView: empty');

    return List.empty();
  } else {
    print('Global length: ' + goals.length.toString());
    return goals;
  }
}

Future<int> deleteGoals(int id) async {
  print('in delete function');
  DatabaseHelper helper = DatabaseHelper.instance;
  await helper.deleteGoal(id);
  print('deleted Id: $id');
  return id;
}

Future<int> editGoals(int id, BuildContext context) async {
  DatabaseHelper helper = DatabaseHelper.instance;
  Goal goal = await helper.queryGoal(id);
  // if (goal == null) {
  //   print('read row $id: empty');
  // } else {
  //   print('read row $id: Category old: ${goal.category}');
  //   goal.category = 'Updated';
  //   print('read row $id: Category new: ${goal.category}');
  // }
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => EditGoal(
              goal: goal,
            )),
  );
  int update = await helper.update(goal);
  print('update: $update');
  return null;
}

Future<void> setOnFire(int id) async {
  DatabaseHelper helper = DatabaseHelper.instance;
  Goal goal = await helper.queryGoal(id);
  int fire = int.parse(goal.onFire);
  fire++;
  goal.onFire = fire.toString();
  await helper.update(goal);
  return null;
}

Future<void> deleteOnFire(int id) async {
  DatabaseHelper helper = DatabaseHelper.instance;
  Goal goal = await helper.queryGoal(id);
  int fire = int.parse(goal.onFire);
  if (fire > 0) fire--;
  goal.onFire = fire.toString();
  await helper.update(goal);
  return null;
}

Future<InfoGoal> showGoal(BuildContext context, int id) async {
  DatabaseHelper helper = DatabaseHelper.instance;
  Goal goal = await helper.queryGoal(id);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return InfoGoal(goal: goal);
      });
}

int progressCalculator(String start, String finish) {
  var dateStart = DateTime.parse(start);
  var dateFinish = DateTime.parse(finish);
  print('Start Date: $dateStart');
  print('Finish Date: $dateFinish');
  var differenceStartFinish = dateFinish.difference(dateStart).inDays + 1;
  print('Difference Start Finish: ' + differenceStartFinish.toString());
  DateTime today = DateTime.now();
  print('Date today: $today');

  int differenceTodayFinish = dateFinish.difference(today).inDays + 1;

  print('Difference Today Finish: ' + differenceTodayFinish.toString());
  int progress =
      100 - ((differenceTodayFinish / differenceStartFinish) * 100).toInt();
  print('Progress in %: $progress');
  return progress;
}

String dateFormat(String date) {
  DateTime tempDate = new DateFormat('yyyy-MM-dd').parse(date);
  return DateFormat('dd.MM.yyyy').format(tempDate);
}
