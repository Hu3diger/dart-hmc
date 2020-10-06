import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc/blocs/imc.bloc.dart';

class IMCWidget extends StatefulWidget {
  @override
  IMCWidgetState createState() => IMCWidgetState();

  final Function(ImcBloc bloc) notifyParent;
  IMCWidget({Key key, @required this.notifyParent}) : super(key: key);
}

class IMCWidgetState extends State<IMCWidget> {

  var bloc = new ImcBloc();
  
  refresh() {
    setState(() {
      this.bloc.resetFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: this.bloc.heightCtrl,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
            ),
            keyboardType: TextInputType.number,
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: this.bloc.weightCtrl,
              decoration: InputDecoration(
                labelText: "Peso (Kg)"
                ),
                keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: FlatButton(
              color: Colors.green[800],
              child: Text(
                "Calcular IMC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ), onPressed: () {
                widget.notifyParent(this.bloc);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(this.bloc.resultIcon,
              color: Colors.green[800],
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              this.bloc.result,
              textAlign: TextAlign.center
            ),
          ),
      ]
    );
  }
}