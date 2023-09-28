import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';

class ErrorPage extends StatelessWidget {
  final Function() onTap;
  final String message;
  const ErrorPage({
    super.key,
    required this.onTap,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset('assets/warning.svg'),
            Gap.h48,
            Text(
              "Oh-oh!",
              style: context.textTheme.titleMedium!.medium.neutralWhite0,
            ),
            Gap.h8,
            Text(
              message,
              style: context.textTheme.titleSmall!.neutralWhite0,
              textAlign: TextAlign.center,
            ),
            Gap.h48,
            ButtonWidget(
              onTap: onTap,
              label: 'Try Again',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
