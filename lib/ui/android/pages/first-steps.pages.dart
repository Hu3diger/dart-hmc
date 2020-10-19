import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/home.pages.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class FirstStepsPage extends StatefulWidget {
  @override
  _FirstStepsPage createState() => _FirstStepsPage();
}

class _FirstStepsPage extends State<FirstStepsPage> {
   List<Slide> slides = new List();

  @override
  void initState() {
  super.initState();

      slides.add(
        new Slide(
          title: "ERASER",
          description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
          pathImage: "images/photo_eraser.png",
          backgroundColor: Color(0xfff5a623),
        ),
      );
      slides.add(
        new Slide(
          title: "PENCIL",
          description: "Ye indulgence unreserved connection alteration appearance",
          pathImage: "images/photo_pencil.png",
          backgroundColor: Color(0xff203152),
        ),
      );
      slides.add(
        new Slide(
          title: "RULER",
          description:
          "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
          pathImage: "images/photo_ruler.png",
          backgroundColor: Color(0xff9932CC),
        ),
      );

  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onDonePress,
      );
  }
}
