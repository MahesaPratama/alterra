import 'package:flutter/material.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/chart_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookComponent buttonWidget = WidgetbookComponent(
  name: 'Button',
  useCases: [
    WidgetbookUseCase(
      name: 'Login',
      builder: (context) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                context.knobs.number(label: 'Margin Horizontal').toDouble(),
          ),
          child: const ButtonWidget(
            label: "Login",
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Next',
      builder: (context) => const Center(
        child: ButtonWidget(
          label: "Next",
          width: 96,
        ),
      ),
    ),
  ],
);

final WidgetbookComponent textFieldWidget = WidgetbookComponent(
  name: 'TextField',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextFieldWidget(
            titleField: context.knobs.boolean(label: 'Title field')
                ? 'Title Field'
                : null,
            hideText: context.knobs.boolean(label: 'Password'),
            // titleField: 'Test',
            prefixIcon: context.knobs.boolean(label: 'Prefix Icon')
                ? 'assets/person.svg'
                : null,
            controller: TextEditingController(),
            gapTitleWithTextField: context.knobs
                .nullableNumber(
                  label: 'Gap Title with Text Field',
                  initialValue: 4,
                )
                ?.toDouble(),
            suffixIcon: context.knobs.boolean(label: 'Suffix Icon')
                ? 'assets/close.svg'
                : null,
          ),
        ),
      ),
    ),
  ],
);

final WidgetbookComponent cardProductWidget = WidgetbookComponent(
  name: 'Card Product',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            100,
            (index) => const Padding(
              padding: EdgeInsets.only(bottom: 8),
              // child: CardProductWidget(),
            ),
          ),
        ),
      ),
    ),
  ],
);

final WidgetbookComponent chartWidget = WidgetbookComponent(
  name: 'Chart Report',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => const Center(
        child: ChartWidget(
          data: SalesReport(
            chart: [],
            date: [],
            mostOrdered: '',
            sales: 0,
            totalRevenue: 0,
            newMember: 0,
          ),
        ),
      ),
    ),
  ],
);
