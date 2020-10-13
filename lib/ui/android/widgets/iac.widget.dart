import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc/blocs/iac.bloc.dart';

class IACWidget extends StatefulWidget {
  @override
  IACWidgetState createState() => IACWidgetState();

  final Function(IacBloc bloc) notifyParent;
  IACWidget({Key key, @required this.notifyParent}) : super(key: key);
}

class IACWidgetState extends State<IACWidget> {

  var bloc = new IacBloc();
  
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
            onChanged: (value) {
              widget.notifyParent(this.bloc);
            },
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: this.bloc.circCtrl,
              decoration: InputDecoration(
                labelText: "Circunferência do quadril (cm)"
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  widget.notifyParent(this.bloc);
                },
            ),
          ),
          Icon(this.bloc.resultIcon,
            color: Colors.green[800],
            size: 80,
          ),
          Text(
            this.bloc.result,
            textAlign: TextAlign.center
          ),
      ]
    );
  }
}