import 'package:flutter/material.dart';

import 'smart.dart';
import 'Goals/goals.dart';

class GoalOverview extends StatefulWidget {
  @override
  _GoalOverviewState createState() => _GoalOverviewState();
}

class _GoalOverviewState extends State<GoalOverview> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "My Goals",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Container(
            color: Theme.of(context).primaryColor,
            margin: new EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Hi Human!',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Container(
                          height: 8,
                        ),
                        Container(
                          child: Text(
                            'Track all your desired goals and reach them!',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Click on the Fire Button each time you worked succesfully towards your habit:',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: new Goals(),
                ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Smart()),
                  );
                },
                child: Text(
                  'Create new goal',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
