import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../goal_overview.dart';
import 'package:intl/intl.dart';
import '../database.dart';

class EditGoal extends StatefulWidget {
  final Goal goal;
  const EditGoal({Key key, this.goal}) : super(key: key);

  @override
  _EditGoalState createState() => _EditGoalState();
}

class _EditGoalState extends State<EditGoal> {
  DateTime _startTime = DateTime.now();
  DateTime _finishTime = DateTime.now();

  Future<void> _saveGoalVar(Goal goal) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.update(goal);
    print('Id $id succesfully updated');
  }

  void currentPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              switch (value) {
                case 0:
                  {
                    setState(() {
                      widget.goal.currentStatus = '0-2';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      widget.goal.currentStatus = '3-5';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      widget.goal.currentStatus = '6-7';
                    });
                  }

                  break;
                default:
              }
            },
            itemExtent: 32.0,
            children: const [
              Text('0-2'),
              Text('3-5'),
              Text('6-7'),
            ],
          );
        });
  }

  void goalPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              switch (value) {
                case 0:
                  {
                    setState(() {
                      widget.goal.goalStatus = '0-2';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      widget.goal.goalStatus = '3-5';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      widget.goal.goalStatus = '6-7';
                    });
                  }

                  break;
                default:
              }
            },
            itemExtent: 32.0,
            children: const [
              Text('0-2'),
              Text('3-5'),
              Text('6-7'),
            ],
          );
        });
  }

  // void measurePicker() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return CupertinoPicker(
  //           backgroundColor: Colors.white,
  //           onSelectedItemChanged: (value) {
  //             switch (value) {
  //               case 0:
  //                 {
  //                   setState(() {
  //                     widget.goal.measuredFactor = '0-2';
  //                   });
  //                 }
  //                 break;
  //               case 1:
  //                 {
  //                   setState(() {
  //                     widget.goal.measuredFactor = '3-5';
  //                   });
  //                 }
  //                 break;
  //               case 2:
  //                 {
  //                   setState(() {
  //                     widget.goal.measuredFactor = '6-7';
  //                   });
  //                 }

  //                 break;
  //               default:
  //             }
  //           },
  //           itemExtent: 32.0,
  //           children: const [
  //             Text('0-2'),
  //             Text('3-5'),
  //             Text('6-7'),
  //           ],
  //         );
  //       });
  // }

  _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _startTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).focusColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).focusColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != _startTime)
      setState(() {
        _startTime = picked;
        widget.goal.startDate = DateFormat('yyyy-MM-dd').format(_startTime);
      });
  }

  _selectFinishDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _finishTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).focusColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).focusColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != _finishTime)
      setState(() {
        _finishTime = picked;
        widget.goal.finishDate = DateFormat('yyyy-MM-dd').format(_finishTime);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Goal",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        margin: new EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Your Name: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.goal.name,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          widget.goal.name = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Category: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.goal.category,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          widget.goal.category = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Current status: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: Text(widget.goal.currentStatus,
                          style: TextStyle(color: Colors.black)),
                      onPressed: currentPicker,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Goal status: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: Text(widget.goal.goalStatus,
                          style: TextStyle(color: Colors.black)),
                      onPressed: goalPicker,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Start date: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: Text('${widget.goal.startDate}',
                          style: TextStyle(color: Colors.black)),
                      onPressed: () => _selectStartDate(context),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Finish date: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      child: Text('${widget.goal.finishDate}',
                          style: TextStyle(color: Colors.black)),
                      onPressed: () => _selectFinishDate(context),
                    ),
                  ),
                ),
              ),
            ),
            // Container(
            //   height: 80,
            //   color: Theme.of(context).primaryColor,
            //   child: Center(
            //     child: ListTile(
            //       title: Text('Measured factor: '),
            //       trailing: Container(
            //         height: 60,
            //         width: MediaQuery.of(context).size.width * 0.4,
            //         child: ElevatedButton(
            //           style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all<Color>(
            //                 Theme.of(context).primaryColor),
            //           ),
            //           child: Text(widget.goal.measuredFactor,
            //               style: TextStyle(color: Colors.black)),
            //           onPressed: measurePicker,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: 80,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: ListTile(
                  title: Text('Reward: '),
                  trailing: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: widget.goal.reward,
                      ),
                      onChanged: (String value) {
                        setState(() {
                          widget.goal.reward = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: new EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).focusColor),
              ),
              onPressed: () async {
                await _saveGoalVar(widget.goal);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalOverview()),
                );
              },
              child: Icon(Icons.local_fire_department)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
