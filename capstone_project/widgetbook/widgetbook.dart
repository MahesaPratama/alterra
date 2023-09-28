import 'package:flutter/material.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:widgetbook/widgetbook.dart';
import 'wb_page.dart';
import 'wb_widget.dart';

class HotreloadWidgetbook extends StatelessWidget {
  const HotreloadWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetbookTheme = WidgetbookTheme(
      data: AppTheme.kThemeLight,
      name: 'Design System',
    );

    final devices = [
      Apple.iMacM1,
      Apple.iPhone13,
      Apple.iPhoneSE2020,
      Samsung.s21ultra,
    ];

    return Widgetbook.material(
      addons: [
        DeviceAddon(
          setting: DeviceSetting(
            devices: devices,
            activeDevice: Apple.iPhone13,
          ),
        ),
        CustomThemeAddon(
          setting: ThemeSetting(
            themes: [widgetbookTheme],
            activeTheme: widgetbookTheme,
          ),
        ),
      ],
      directories: [
        WidgetbookCategory(
          name: 'Widgets',
          children: [
            buttonWidget,
            textFieldWidget,
            cardProductWidget,
            chartWidget,
          ],
        ),
        WidgetbookCategory(
          name: 'Pages',
          children: [
            loginPage,
          ],
        ),
      ],
    );
  }
}
