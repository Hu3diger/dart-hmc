import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hmc/blocs/imc.bloc.dart';

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
          child: 
          Text(
            "IMC",
            textScaleFactor: 3,
            textAlign: TextAlign.center
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            controller: this.bloc.heightCtrl,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => {
              widget.notifyParent(this.bloc)
            },
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
              onChanged: (value) => {
                widget.notifyParent(this.bloc)
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
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                    avgData(),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ]
    );
  }
  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
              const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            if (value.toInt() == 0){
              return 'MAGREZA';
            }
            else if (value.toInt() == 1){
              return 'NORMAL';
            }
            else if (value.toInt() == 2){
              return 'SOBREPESO';
            }
            else if (value.toInt() == 3){
              return 'OBESIDADE';
            }
            else if (value.toInt() == 4){
              return 'OBESIDADE GRAVE';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 4,
      minY: 15,
      maxY: 45,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 18.5),
            FlSpot(1, 24.9),
            FlSpot(2, 29.9),
            FlSpot(3, 29.9),
            FlSpot(4, 40),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true),
        ),
      ],
    );
  }
}
