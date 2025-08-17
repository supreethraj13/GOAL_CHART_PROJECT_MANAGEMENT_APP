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
  List<Color> colorList = [ Colors.blue[500]!,Colors.red[500]!,];

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
      color: Colors.white,
      elevation: 6,
      margin: EdgeInsets.all(5),
      shadowColor: Colors.grey[300]!,
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
              chartRadius: MediaQuery.of(context).size.width / 3,
              colorList: colorList ,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 20,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: true,
                decimalPlaces: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
