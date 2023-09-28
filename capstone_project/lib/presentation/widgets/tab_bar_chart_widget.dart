import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/bloc/sales_report/sales_report_bloc.dart';

class TabBarChartWidget extends StatelessWidget {
  final TabController? tabController;
  const TabBarChartWidget({
    super.key,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kNeutralWhite50,
        borderRadius: BorderRadius.circular(30),
      ),
      // Tab Bar
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        controller: tabController,
        labelColor: AppColor.kNeutralBlack700,
        onTap: (int value) {
          switch (value) {
            case 0:
              context.read<SalesReportBloc>().add(
                    const FetchSalesReportQuery(
                      timeframe: 'daily',
                    ),
                  );
              break;
            case 1:
              context.read<SalesReportBloc>().add(
                    const FetchSalesReportQuery(
                      timeframe: 'weekly',
                    ),
                  );
              break;
            case 2:
              context.read<SalesReportBloc>().add(
                    const FetchSalesReportQuery(
                      timeframe: 'monthly',
                    ),
                  );
              break;
            case 3:
              context.read<SalesReportBloc>().add(
                    const FetchSalesReportQuery(
                      timeframe: 'one-year',
                    ),
                  );
              break;
            case 4:
              context.read<SalesReportBloc>().add(
                    const FetchSalesReportQuery(
                      timeframe: 'all',
                    ),
                  );
              break;
          }
        },
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.kWhite,
          boxShadow: const [
            BoxShadow(
                color: AppColor.kNeutralWhite800,
                blurRadius: 6,
                offset: Offset(0.5, 0.5)),
          ],
        ),
        tabs: [
          Tab(
            child: Text("1D", style: context.textTheme.titleSmall),
          ),
          Tab(
            child: Text("1W", style: context.textTheme.titleSmall),
          ),
          Tab(
            child: Text("1M", style: context.textTheme.titleSmall),
          ),
          Tab(
            child: Text("1Y", style: context.textTheme.titleSmall),
          ),
          Tab(
            child: Text("All", style: context.textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}
