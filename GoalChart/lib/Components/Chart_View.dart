import 'package:flutter/material.dart';
import 'package:GoalChart/Datatypes/Project_data_model.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartView extends StatefulWidget {
  List<Projects> Project_List;

  ChartView(this.Project_List);

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  get colorList => [Colors.red, Colors.orange, Colors.purpleAccent];

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Done": widget.Project_List.where((project) => project.isDone == true)
          .length
          .toDouble(),
      "Pending": widget.Project_List.where((project) => project.isDone == false)
          .length
          .toDouble(),
    };

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
      ListTile(
      title: Text(
        'Dashboard',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),),
          Container(
            height: 300,
            width: 300,
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 1000),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
