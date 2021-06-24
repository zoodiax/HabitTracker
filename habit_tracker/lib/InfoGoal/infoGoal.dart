import 'package:flutter/material.dart';
import '../database.dart';

/// This is the stateless widget that the main application instantiates.
class InfoGoal extends StatelessWidget {
  final Goal goal;

  InfoGoal({Key key, this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Inside Infogoal');
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                  ],
                ),
                title: Text(
                  'Your Name:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.name.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category),
                  ],
                ),
                title: Text(
                  'Category:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.category.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.today),
                  ],
                ),
                title: Text(
                  'StartDate:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.startDate.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.event),
                  ],
                ),
                title: Text(
                  'Finish Date:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.finishDate.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
                title: Text(
                  'Current Status:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.currentStatus.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.trending_up),
                  ],
                ),
                title: Text(
                  'Goal status:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.goalStatus.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            // Container(
            //   child: ListTile(
            //     leading: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.assessment),
            //       ],
            //     ),
            //     title: Text(
            //       'Measured Factor:',
            //       style: TextStyle(
            //         color: Colors.grey[500],
            //         fontSize: 14,
            //       ),
            //     ),
            //     subtitle: Text(
            //       goal.measuredFactor.toString(),
            //       style: Theme.of(context).textTheme.headline3,
            //     ),
            //   ),
            // ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events),
                  ],
                ),
                title: Text(
                  'Reward:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.reward.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_fire_department),
                  ],
                ),
                title: Text(
                  'On Fire:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  goal.onFire.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
