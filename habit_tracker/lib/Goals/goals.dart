import 'package:flutter/material.dart';
import '../database.dart';
import '../Goals/goals_logic.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

enum Setting { delete, edit }

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  List<Goal> _listViewList = [];
  List<int> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  Future<void> asyncInit() async {
    List<Goal> goals = [];
    goals = await createListViewGoals();
    setState(() {
      _listViewList = goals;
    });
  }

  Widget progressCircle(String start, String finish) {
    int progress = progressCalculator(start, finish);
    print('Inside Progress Circle');
    return CircularStepProgressIndicator(
      totalSteps: 100,
      currentStep: progress,
      stepSize: 10,
      selectedColor: Theme.of(context).focusColor,
      unselectedColor: Colors.grey[200],
      padding: 0,
      width: 55,
      height: 55,
      selectedStepSize: 5,
      unselectedStepSize: 5,
      roundedCap: (_, __) => true,
      child: Container(
        child: Text('$progress%'),
        alignment: Alignment.center,
      ),
    );
  }

  Future<Widget> settingDialog(int id) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('SettingsD'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Setting.edit);
                },
                child: const Text('Edit'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Setting.delete);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        })) {
      case Setting.edit:
        print('edit clicked');
        await editGoals(id, context);
        List<Goal> goals = await createListViewGoals();
        setState(() {
          _listViewList = goals;
        });
        break;
      case Setting.delete:
        print('delete clicked');
        await deleteGoals(id);
        List<Goal> goals = await createListViewGoals();
        setState(() {
          _listViewList = goals;
        });
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 2,
            ),
        padding: const EdgeInsets.all(8),
        itemCount: _listViewList.length,
        itemBuilder: (BuildContext context, int index) {
          String startDateFormat = dateFormat(_listViewList[index].startDate);
          String finishDateFormat = dateFormat(_listViewList[index].finishDate);

          return ListTile(
              onTap: () async {
                showGoal(context, _listViewList[index].id);
              },
              onLongPress: () async {
                await settingDialog(_listViewList[index].id);
              },
              leading: progressCircle(_listViewList[index].startDate,
                  _listViewList[index].finishDate),
              title: Text('${_listViewList[index].category}'),
              subtitle: Text(
                  'Start Date: $startDateFormat \nFinish Date: $finishDateFormat'),
              trailing: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _selectedItems.add(index);
                  });
                  await setOnFire(_listViewList[index].id);
                },
                onLongPress: () async {
                  setState(() {
                    _selectedItems.remove(index);
                  });
                  await deleteOnFire(_listViewList[index].id);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Icon(Icons.local_fire_department,
                    color: (_selectedItems.contains(index)
                        ? Theme.of(context).focusColor
                        : Colors.grey)),
              ));
        });
  }
}
