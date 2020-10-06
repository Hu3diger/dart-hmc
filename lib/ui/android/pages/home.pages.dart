import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/blocs/iac.bloc.dart';
import 'package:imc/blocs/imc.bloc.dart';
import 'package:imc/blocs/theme.bloc.dart';
import 'package:imc/ui/android/widgets/iac.widget.dart';
import 'package:imc/ui/android/widgets/imc.widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<IMCWidgetState> _keyIMC = GlobalKey();
  final GlobalKey<IACWidgetState> _keyIAC = GlobalKey();
  PageController pageController = PageController(initialPage: 0);
  double currentPage;

  _refreshIMC(ImcBloc bloc) {
    setState(() {
      bloc.calculate();
    });
  }

  _refreshIAC(IacBloc bloc) {
    setState(() {
      bloc.calculate();
    });
  }
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
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
            Text('Human Mass Calc.'),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            setState(() {
              print(pageController.page);
              if (pageController.page == 0){
                _keyIMC.currentState.refresh();
              } else if (pageController.page == 1){
                _keyIAC.currentState.refresh();
              }
            });
          })
        ],
        ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: <Widget>[
                IMCWidget(
                  key: _keyIMC,
                  notifyParent: _refreshIMC
                ),
                IACWidget(
                  key: _keyIAC,
                  notifyParent: _refreshIAC
                )
              ],  
            ),
          ),
          Expanded(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
              effect: ExpandingDotsEffect()
            )
          )
        ],
      ),
    );
  }
}