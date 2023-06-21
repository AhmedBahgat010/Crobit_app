import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Soil%20Status/cubit/States.dart';
import 'package:app_final/view/Soil%20Status/cubit/cubit.dart';
import 'package:app_final/view/Soil%20Status/widget/Basic_Rates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../core/style/my_colors.dart';
import '../../network/models/SoilStatusModel.dart';

class SoilStatus extends StatefulWidget {
  const SoilStatus({Key? key}) : super(key: key);

  @override
  State<SoilStatus> createState() => _SoilStatusState();
}

class _SoilStatusState extends State<SoilStatus> {
  SelectionBehavior? _selectionBehavior;

//   late List<_ChartData> data;
  TooltipBehavior? _tooltip;

  @override
  Widget build(BuildContext context) {

    final List<ChartData> chartData = <ChartData>[
      ChartData('27/10', 128, 129, 90),
      ChartData('28/10', 123, 100, 93),
      ChartData('29/10', 128, 129, 30),
      ChartData('30/10', 87, 95, 71),
      ChartData('30/11', 87, 95, 71),

    ];
    _tooltip = TooltipBehavior(enable: true);
    return BlocConsumer<SoilStatusCubit, SoilStatusStates>(
  listener: (context, state) {
    // TODO: implement listener
    print(state);
  },
  builder: (context, state) {
    List<SoilStatusModel>? diseasesModel= SoilStatusCubit.get(context)?.diseasesModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Soil Status",
            style: TextStyle(color: AppColor.black, fontSize: 30)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height/1.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColor.greenDark),
                    borderRadius: BorderRadius.circular(15), //<-- S
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "This week",
                              style: mediumStyle,
                            ),
                            Spacer(),
                            Text(
                              "W",
                              style: mediumStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "M",
                              style: mediumStyle.apply(color: AppColor.gray),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "6M",
                              style: mediumStyle.apply(color: AppColor.gray),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            selectionType: SelectionType.point,
                            tooltipBehavior: _tooltip,
                            series: <ChartSeries<ChartData, String>>[
                              ColumnSeries<ChartData, String>(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  name: 'potassium',

                                  color: Color(0xffCFA841),
                                  selectionBehavior: _selectionBehavior,
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y),
                              ColumnSeries<ChartData, String>(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color(0xff4BA26A),
                                  name: "phosphorous",
                                  selectionBehavior: _selectionBehavior,
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y1),
                              ColumnSeries<ChartData, String>(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  selectionBehavior: _selectionBehavior,
                                  name: "Nitrogen",
                                  color: Color(0xffF6C602),
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y2)
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Containerpercent(
                                      color: Color(0xffCFA841),
                                      titel: " potassium"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Containerpercent(
                                      color: Color(0xffF6C602),
                                      titel: " Nitrogen"),
                                ],
                              ),
                              Containerpercent(
                                  color: Color(0xff4BA26A),
                                  titel: " phosphorous"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Basic Rates",
                style: labelStyle2,
              ),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return BasicRates();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);

  final String x;
  final double? y;
  final double? y1;
  final double? y2;
}

Widget Containerpercent({
  String? titel,
  Color? color,
}) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      ),
      SizedBox(
        width: 10,
      ),
      Text(titel!, style: hintStyle.apply(fontSizeDelta: -2)),
    ],
  );
}
