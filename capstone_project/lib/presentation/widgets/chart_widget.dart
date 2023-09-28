import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';

class ChartWidget extends StatefulWidget {
  final SalesReport data;
  const ChartWidget({
    super.key,
    required this.data,
  });

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<Color> gradientColors = [
    AppColor.kFirecrackerSalmon,
    AppColor.kFirecrackerSalmon.withOpacity(0),
  ];

  bool touchActive = false;
  String? price;
  String? date;

  @override
  Widget build(BuildContext context) {
    List<int> showingTooltipOnSpots = [0, widget.data.chart.length - 1];
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: widget.data.chart,
        isCurved: true,
        color: AppColor.kFirecrackerSalmon,
        barWidth: 1,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
        ),
        dotData: FlDotData(
          show: false,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date ?? widget.data.date.last,
          style: context.textTheme.labelLarge,
        ),
        Text(
          price ?? widget.data.chart.last.y.formatCurrency(),
          style: context.textTheme.displayMedium,
        ),
        AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 4,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return LineChart(
                  LineChartData(
                    showingTooltipIndicators:
                        showingTooltipOnSpots.map((index) {
                      return ShowingTooltipIndicators([
                        LineBarSpot(
                          tooltipsOnBar,
                          lineBarsData.indexOf(tooltipsOnBar),
                          tooltipsOnBar.spots[index],
                        ),
                      ]);
                    }).toList(),
                    lineTouchData: LineTouchData(
                      enabled: touchActive,
                      handleBuiltInTouches: touchActive,
                      touchCallback:
                          (FlTouchEvent event, LineTouchResponse? response) {
                        if (response == null || response.lineBarSpots == null) {
                          setState(() {
                            touchActive = false;
                          });
                          return;
                        }
                        if (event is FlLongPressStart) {
                          final index = response.lineBarSpots!.first.spotIndex;
                          setState(() {
                            touchActive = true;
                            price = widget.data.chart[index].y.formatCurrency();
                            date = widget.data.date[index];
                          });
                        }
                        if (event is FlLongPressMoveUpdate) {
                          final index = response.lineBarSpots!.first.spotIndex;
                          setState(() {
                            touchActive = true;
                            price = widget.data.chart[index].y.formatCurrency();
                            date = widget.data.date[index];
                          });
                        }
                        if (event is FlLongPressEnd) {
                          setState(() {
                            touchActive = false;
                            price = widget.data.chart.last.y.formatCurrency();
                            date = widget.data.date.last;
                          });
                        }
                      },
                      getTouchedSpotIndicator:
                          (LineChartBarData barData, List<int> spotIndexes) {
                        return spotIndexes.map((index) {
                          return TouchedSpotIndicatorData(
                            FlLine(
                              color: Colors.transparent,
                            ),
                            FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                radius: 3,
                                color: AppColor.kBlack,
                                strokeWidth: 1,
                                strokeColor: AppColor.kDrWhite,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      touchTooltipData: LineTouchTooltipData(
                        fitInsideHorizontally: true,
                        tooltipBgColor: Colors.transparent,
                        getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                          return lineBarsSpot.map((lineBarSpot) {
                            return LineTooltipItem(
                              touchActive
                                  ? widget.data.date[lineBarSpot.x.toInt()]
                                  : lineBarSpot.y.formatCurrency(),
                              const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    lineBarsData: lineBarsData,
                    minX: 0,
                    maxX: widget.data.chart.length - 1,
                    minY: widget.data.chart.first.y,
                    maxY: widget.data.chart.last.y,
                    titlesData: FlTitlesData(
                      show: false,
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
