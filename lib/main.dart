import 'package:flutter/material.dart';
import "story_brain.dart";

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(child: destin()),
      ),
    );
  }
}

class destin extends StatefulWidget {
  destin({Key key}) : super(key: key);

  @override
  _destinState createState() => _destinState();
}

class _destinState extends State<destin> {
  StoryBrain sb = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 12,
            child: Center(
              child: Text(
                sb.getStory(),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  sb.nextStory(1);
                });
              },
              color: Colors.red,
              child: Text(
                sb.getChoice1(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 2,
            child: Visibility(
              visible: sb.buttonShouldBeVisible(),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    sb.nextStory(2);
                  });
                },
                color: Colors.blue,
                child: Text(
                  sb.getChoice2(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
