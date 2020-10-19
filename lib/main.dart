import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:imc/blocs/theme.bloc.dart';
import 'package:imc/ui/android/pages/first-steps.pages.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final theme = Provider.of<ThemeChanger>(context) ;

    return MaterialApp(
      title: 'IMC',
        debugShowCheckedModeBanner: false,
        home: FirstStepsPage(),
        theme: theme.getTheme()
    );
  }
}

