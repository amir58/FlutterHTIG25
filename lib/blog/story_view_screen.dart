import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({Key? key}) : super(key: key);

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {


  final controller = StoryController();

  @override
  Widget build(context) {
    List<StoryItem> storyItems = [
      StoryItem.text(
        title: 'Flutter Story View', backgroundColor: Colors.blueGrey,),
      StoryItem.pageImage(url: 'https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png', controller: controller),
      StoryItem.pageImage(url: 'https://burst.shopifycdn.com/photos/two-customized-cars-rolling-through-a-city-street.jpg', controller: controller),
    ]; // your list of stories

    return StoryView(
        storyItems: storyItems,
        controller: controller,
        // pass controller here too
        repeat: true,
        // should the stories be slid forever
        onComplete: () {},
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        } // To disable vertical swipe gestures, ignore this parameter.
      // Preferrably for inline story view.
    );
  }

}
