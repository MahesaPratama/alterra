import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/constants/constant.dart';

class CardProductWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final num price;
  final bool status;
  final VoidCallback? onTap;

  const CardProductWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: status ? AppColor.kDrWhite : AppColor.kNeutralWhite100,
          border: Border.all(
            color: status ? AppColor.kBlueberyWhip : AppColor.kNeutralWhite500,
            strokeAlign: BorderSide.strokeAlignInside,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.clear),
                ),
                height: 66,
                width: 66,
                fit: BoxFit.cover,
              ),
            ),
            Gap.w16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleSmall!.semiBold,
                  ),
                  Gap.h4,
                  Text(
                    description,
                    style: context.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Gap.w16,
            status
                ? Text(
                    price.toString(),
                    style: context.textTheme.titleSmall!.semiBold,
                  )
                : SvgPicture.asset('assets/sold_out.svg'),
          ],
        ),
      ),
    );
  }
}
