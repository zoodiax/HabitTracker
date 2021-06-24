import 'package:flutter/material.dart';

import 'createSmart.dart';

class Smart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set SMART Goals",
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
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'A good strategy to set goals you can achieve is the SMART strategy:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ]),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                minLeadingWidth: 90,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'S',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor),
                            ),
                            TextSpan(text: 'pecific')
                          ]),
                    ),
                  ],
                ),
                title: Text(
                  'Target one specific area you want to imporve',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Run 3 times a week, eat 5 veggies every day, or visit more often your parents',
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                minLeadingWidth: 90,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'M',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor),
                            ),
                            TextSpan(text: 'easurable')
                          ]),
                    ),
                  ],
                ),
                title: Text(
                  'Quantify an indicator of progress',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Click on the Fire-Button on this app every day you worked towards your goal',
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                minLeadingWidth: 90,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'A',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor),
                            ),
                            TextSpan(text: 'ssignable')
                          ]),
                    ),
                  ],
                ),
                title: Text(
                  'Who will do it? You will!',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Enter your name and give yourself the responsiblity for reaching the goal',
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                minLeadingWidth: 90,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'R',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor),
                            ),
                            TextSpan(text: 'ealistic')
                          ]),
                    ),
                  ],
                ),
                title: Text(
                  'Set yourself realistic goals',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Increase the goal status 10-20% to your current status - learn to love the progress, the results will follow',
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                minLeadingWidth: 90,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'T',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).focusColor),
                            ),
                            TextSpan(text: 'ime-related')
                          ]),
                    ),
                  ],
                ),
                title: Text(
                  'When can the results be achieved',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'Set yourself a time periode for the goal - e.g. two weeks, a month, three months - then you can evaluate your performance afterwards',
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Additional you can set yourself a reward when reaching a goal',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                subtitle: Text(
                  'E.g. Going to your favourite restaurant or doing a spa day',
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateSmart()),
              );
            },
            child: Text(
              'Create SMART goal',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
