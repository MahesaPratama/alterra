import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/sales_report/sales_report_bloc.dart';
import 'package:mobile_flutter/presentation/pages/error_page.dart';
import 'package:mobile_flutter/presentation/widgets/chart_widget.dart';
import 'package:mobile_flutter/presentation/widgets/loading_widget.dart';
import 'package:mobile_flutter/presentation/widgets/report_card_widget.dart';
import 'package:mobile_flutter/presentation/widgets/tab_bar_chart_widget.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({super.key});

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<SalesReportBloc>().add(
            const FetchSalesReportQuery(
              timeframe: 'daily',
            ),
          ),
    );
    _tabController = TabController(
      initialIndex: _selectedIndex,
      length: 5,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'Sales Report',
          style: context.textTheme.headlineSmall!.semiBold,
        ),
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
      ),
      body: BlocBuilder<SalesReportBloc, SalesReportState>(
        builder: (context, state) {
          if (state is ConnectionErrorState) {
            String timeFrame = 'daily';
            switch (_selectedIndex) {
              case 0:
                timeFrame = 'daily';
                break;
              case 1:
                timeFrame = 'weekly';
                break;
              case 2:
                timeFrame = 'monthly';
                break;
              case 3:
                timeFrame = 'one-year';
                break;
              case 4:
                timeFrame = 'all';
                break;
            }
            return ErrorPage(
              onTap: () => context.read<SalesReportBloc>().add(
                    FetchSalesReportQuery(
                      timeframe: timeFrame,
                    ),
                  ),
              message: state.message,
            );
          } else if (state is ErrorState) {
            String timeFrame = 'daily';
            switch (_selectedIndex) {
              case 0:
                timeFrame = 'daily';
                break;
              case 1:
                timeFrame = 'weekly';
                break;
              case 2:
                timeFrame = 'monthly';
                break;
              case 3:
                timeFrame = 'one-year';
                break;
              case 4:
                timeFrame = 'all';
                break;
            }
            return ErrorPage(
              onTap: () => context.read<SalesReportBloc>().add(
                    FetchSalesReportQuery(
                      timeframe: timeFrame,
                    ),
                  ),
              message: state.message,
            );
          } else if (state is LoadingState) {
            return const LoadingWidget();
          } else if (state is LoadedState) {
            final data = state.salesReportEntity;
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Gap.h24,
                    ChartWidget(data: data),
                    TabBarChartWidget(
                      tabController: _tabController,
                    ),
                    Gap.h24,
                    BlocBuilder<SalesReportBloc, SalesReportState>(
                      builder: (context, state) {
                        return GridView.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Most Ordered card
                            ReportCardWidget(
                              svgName: 'restaurant.svg',
                              color: AppColor.kRedRemains,
                              title: 'Most Ordered',
                              item: data.mostOrdered,
                            ),
                            // Sales card
                            ReportCardWidget(
                                svgName: 'sales.svg',
                                color: AppColor.kCreamyBeige,
                                title: 'Sales',
                                item: data.sales.toString()),
                            // Total Revenue card
                            ReportCardWidget(
                              svgName: 'dollar.svg',
                              color: AppColor.kSmellTheMint,
                              title: 'Total Revenue',
                              item: data.totalRevenue.formatCurrency(),
                            ),
                            // New Member card
                            ReportCardWidget(
                              svgName: 'member.svg',
                              color: AppColor.kIceCitadel,
                              title: 'New Member',
                              item: data.newMember.toString(),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is EmptyState) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Gap.h24,
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Center(
                        child: Text(
                          'No History',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    TabBarChartWidget(
                      tabController: _tabController,
                    ),
                    Gap.h24,
                    BlocBuilder<SalesReportBloc, SalesReportState>(
                      builder: (context, state) {
                        return GridView.count(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            // Most Ordered card
                            ReportCardWidget(
                              svgName: 'restaurant.svg',
                              color: AppColor.kRedRemains,
                              title: 'Most Ordered',
                              item: '-',
                            ),
                            // Sales card
                            ReportCardWidget(
                              svgName: 'sales.svg',
                              color: AppColor.kCreamyBeige,
                              title: 'Sales',
                              item: '-',
                            ),
                            // Total Revenue card
                            ReportCardWidget(
                              svgName: 'dollar.svg',
                              color: AppColor.kSmellTheMint,
                              title: 'Total Revenue',
                              item: '-',
                            ),
                            // New Member card
                            ReportCardWidget(
                              svgName: 'member.svg',
                              color: AppColor.kIceCitadel,
                              title: 'New Member',
                              item: '-',
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
