import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
