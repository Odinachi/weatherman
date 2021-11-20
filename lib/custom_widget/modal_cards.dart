import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherman/utils/app_colors.dart';
import 'package:weatherman/utils/app_text.dart';
import 'package:weatherman/utils/weatherman_assets.dart';

class VerticalForecastReportCard extends StatelessWidget {
  const VerticalForecastReportCard({Key key, this.icon, this.temp, this.time})
      : super(key: key);
  final String temp;
  final String icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              temp ?? "0",
              style: WeathermanAssets.customeTextStyle(
                size: 16,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              AppText.centigrade,
              style: WeathermanAssets.customeTextStyle(
                size: 9,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SvgPicture.asset(
            icon ?? WeathermanAssets.dummySunIcon,
            height: 45,
          ),
        ),
        Text(
          '${time ?? "0:00"}',
          style: WeathermanAssets.customeTextStyle(
            size: 12,
            color: AppColors.textBlack,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ));
  }
}

class HorizontalForecastReportCard extends StatelessWidget {
  const HorizontalForecastReportCard({Key key, this.icon, this.temp, this.date})
      : super(key: key);
  final String temp;
  final String icon;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${date ?? "April 16"}',
              style: WeathermanAssets.customeTextStyle(
                size: 14,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                icon ?? WeathermanAssets.dummySunIcon,
                height: 25,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  temp ?? "0",
                  style: WeathermanAssets.customeTextStyle(
                    size: 16,
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  AppText.centigrade,
                  style: WeathermanAssets.customeTextStyle(
                    size: 9,
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: AppColors.textPurple.withOpacity(0.5),
        )
      ],
    ));
  }
}
