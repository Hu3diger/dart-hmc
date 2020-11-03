import 'package:flutter/material.dart';
import 'package:hmc/ui/android/pages/home.pages.dart';
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
          title: "IMC",
          description: "Para realizar o cálculo de IMC, basta preencher os campos:\n- Peso em Kg \n- Altura em cm. \nO cálculo será efetuado automaticamente \n\n\n Conceito de IMC: É um cálculo que serve para: \n - Avaliar se a pessoa está dentro do seu peso ideal em relação à altura.",
          backgroundColor: Color(0XFF00897B),
          pathImage: "img/imc.png"
        ),
      );
      slides.add(
        new Slide(
          title: "IAC",
          description: "Para realizar o cálculo de IAC, basta preencher os campos:\n- Altura em cm \n- Circunferência do quadrial em cm. \nO cálculo será efetuado automaticamente \n\n\n Conceito de IAC: É um cálculo que serve para: \n - Avaliar o percentual de gordura presente no corpo.",
          backgroundColor: Color(0XFF00796B),
           pathImage: "img/iac.png"
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
