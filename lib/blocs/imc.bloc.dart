import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class ImcBloc {
  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  var result = "Preencha os dados para calcular seu IMC";
  var resultIcon = Icons.info_outline;

  calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result = "Abaixo do peso (${imc.toStringAsPrecision(2)})";
      resultIcon = Icons.sentiment_neutral;
    }
    else if (imc >= 18.6 && imc <= 24.9) {
       result = "Peso Ideal (${imc.toStringAsPrecision(2)})";
       resultIcon = Icons.sentiment_very_satisfied;
    }
    else if (imc >= 24.9 && imc <= 29.9) {
       result = "Levemente acima do peso (${imc.toStringAsPrecision(2)})";
       resultIcon = Icons.sentiment_neutral;
    }
    else if (imc >= 24.9 && imc <= 34.9) {
       result = "Obesidade Grau I (${imc.toStringAsPrecision(2)})";
       resultIcon = Icons.mood_bad;
    }
    else if (imc >= 34.9 && imc <= 39.9) {
       result = "Obesidade Grau II (${imc.toStringAsPrecision(2)})";
       resultIcon = Icons.sentiment_dissatisfied;
    }
    else if (imc >= 40) {
       result = "Obesidade Grau III (${imc.toStringAsPrecision(2)})";
       resultIcon = Icons.sentiment_very_dissatisfied;
    }    
  }

  resetFields()
  {
      weightCtrl.text = '';
      heightCtrl.text = '';
      result = "Informe seus dados.";
      resultIcon = Icons.info_outline;
  }
}