import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'goal_overview.dart';
import 'package:intl/intl.dart';
import 'database.dart';

class CreateSmart extends StatefulWidget {
  @override
  _CreateSmartState createState() => _CreateSmartState();
}

class _CreateSmartState extends State<CreateSmart> {
  DateTime _startTime = DateTime.now();
  DateTime _finishTime = DateTime.now();

  String _name = 'initName';
  String _reward = 'initReward';
  String _category = 'Select a category';
  String _currentStatus = 'How often per week do you work on this goal?';
  String _goalStatus = 'How often do you want to work on this goal?';
  String _startDate = 'Pick Start Date';
  String _finishDate = 'Pick Finish Date';
  String _measureFactor = 'How do you want to measure your process?';
  String _onFire = '0';

  @override
  void initState() {
    super.initState();
    initDate();
  }

  void initDate() {
    DateTime _tmp = DateTime.now();
    setState(() {
      _startDate = DateFormat('yyyy-MM-dd').format(_tmp);
      _finishDate = DateFormat('yyyy-MM-dd').format(_tmp);
    });
  }

  Future<void> _saveGoalVar(
      String name,
      String category,
      String currentStatus,
      String goalStatus,
      String startDate,
      String finishDate,
      // String measuredFactor,
      String reward,
      String onFire) async {
    // insert
    Goal goal = Goal();
    goal.name = name;
    goal.category = category;
    goal.currentStatus = currentStatus;
    goal.goalStatus = goalStatus;
    goal.startDate = startDate;
    goal.finishDate = finishDate;
    // goal.measuredFactor = measuredFactor;
    goal.reward = reward;
    goal.onFire = onFire;

    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(goal);
    print('inserted row: $id');
  }

  void showData() {
    print('Name: $_name \n');
    print('Category: $_category \n');
    print('CurrentStatus: $_currentStatus \n');
    print('GoalStatus: $_goalStatus \n');
    print('StartDate: $_startDate');
    print('FinishDate: $_finishDate');
    // print('MeasureFactor: $_measureFactor \n');
    print('Reward: $_reward \n');
  }

  void categoryPicker() {
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
                      _category = 'Visit more often the gym';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      _category = 'Eat 5 veggies a day';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      _category = 'Go for a run';
                    });
                  }

                  break;
                default:
              }
            },
            itemExtent: 32.0,
            children: const [
              Text('Visit more often the gym'),
              Text('Eat 5 veggies a day'),
              Text('Go of a run'),
            ],
          );
        });
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
                      _currentStatus = '0-2';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      _currentStatus = '3-5';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      _currentStatus = '6-7';
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
                      _goalStatus = '0-2';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      _goalStatus = '3-5';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      _goalStatus = '6-7';
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

  void measurePicker() {
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
                      _measureFactor = '0-2';
                    });
                  }
                  break;
                case 1:
                  {
                    setState(() {
                      _measureFactor = '3-5';
                    });
                  }
                  break;
                case 2:
                  {
                    setState(() {
                      _measureFactor = '6-7';
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

  Future<Widget> _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
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

    // showDatePicker(
    //     context: context,
    //     initialDate: _startTime,
    //     firstDate: DateTime(2020),
    //     lastDate: DateTime(2025));
    if (picked != null && picked != _startTime)
      setState(() {
        _startTime = picked;
        _startDate = DateFormat('yyyy-MM-dd').format(_startTime);
        print('startDate: $_startDate');
      });
  }

  _selectFinishDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _finishTime,
        firstDate: DateTime(2020),
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
        lastDate: DateTime(2025));
    if (picked != null && picked != _finishTime)
      setState(() {
        _finishTime = picked;
        _finishDate = DateFormat('yyyy-MM-dd').format(_finishTime);
        print('finish Date: $_finishDate');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create SMART Goal",
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
                        hintText: 'Enter Name',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _name = value;
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
                    child:
                        // ElevatedButton(
                        //   style: ButtonStyle(
                        //     backgroundColor: MaterialStateProperty.all<Color>(
                        //         Theme.of(context).primaryColor),
                        //   ),
                        //   child: Text(_category,
                        //       style: TextStyle(color: Colors.black)),
                        //   onPressed: categoryPicker,
                        // ),
                        TextField(
                      showCursor: true,
                      readOnly: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Choose category',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _category = value;
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
                      child: Text(_currentStatus,
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
                      child: Text(_goalStatus,
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
                      child: Text('$_startDate',
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
                      child: Text('$_finishDate',
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
            //           child: Text(_measureFactor,
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
                        hintText: 'Enter Reward',
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _reward = value;
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
                //showData,
                await _saveGoalVar(
                    _name,
                    _category,
                    _currentStatus,
                    _goalStatus,
                    _startDate,
                    _finishDate,
                    // _measureFactor,
                    _reward,
                    _onFire);
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
