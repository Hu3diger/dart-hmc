import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class IacBloc {
  var heightCtrl = new MaskedTextController(mask: '000');
  var circCtrl = new MaskedTextController(mask: '000');
  var result = "IAC - Preencha os dados para calcular";
  var resultIcon = Icons.info_outline;

  calculate() {
    double circ = double.parse(circCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double iac = (circ / pow(height, 1.5)) - 18;

    if (iac < 8) {
      result = "Não existe estudos para tal valor. (${iac.toStringAsPrecision(2)})%";
      resultIcon = Icons.sentiment_neutral;
    }
    else if (iac >= 8.01 && iac <= 20) {
       result = "Adiposidade normal. (${iac.toStringAsPrecision(2)})%";
       resultIcon = Icons.sentiment_very_satisfied;
    }
    else if (iac >= 20.01 && iac <= 25) {
       result = "Sobrepeso (${iac.toStringAsPrecision(2)})%";
       resultIcon = Icons.sentiment_dissatisfied;
    }
    else if (iac >= 25.01) {
       result = "Obesidade (${iac.toStringAsPrecision(2)})%";
       resultIcon = Icons.sentiment_very_dissatisfied;
    }    
  }

  resetFields()
  {
      circCtrl.text = '';
      heightCtrl.text = '';
      result = "IAC - Preencha os dados para calcular";
      resultIcon = Icons.info_outline;
  }
}