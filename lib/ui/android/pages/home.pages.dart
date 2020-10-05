import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/blocs/imc.bloc.dart';
import 'package:imc/blocs/theme.bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var bloc = new ImcBloc();
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Switch(
                value: isOn,
                onChanged: (val) {
                  setState(() {
                    isOn = val;
                    _themeChanger.setTheme(isOn ? ThemeData.dark() : ThemeData.light());
                  });
                })
            ),
            Text('Calculadora IMC'),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            setState(() {
              bloc.resetFields();
            });
          })
        ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: bloc.heightCtrl,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                ),
                keyboardType: TextInputType.number,
              ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: bloc.weightCtrl,
                  decoration: InputDecoration(
                    labelText: "Peso (Kg)"
                    ),
                    keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ), onPressed: () {
                    setState(() {
                      bloc.calculate();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Icon(bloc.resultIcon,
                  color: Theme.of(context).primaryColor,
                  size: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  bloc.result,
                  textAlign: TextAlign.center
                ),
              ),
          ],
        ),
    );
  }
}