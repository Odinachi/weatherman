import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weatherman/custom_widget/modal_cards.dart';
import 'package:weatherman/utils/app_colors.dart';
import 'package:weatherman/utils/app_text.dart';
import 'package:weatherman/utils/weatherman_assets.dart';

Map<String, List> _elements = {
  '${AppText.newText}': <Widget>[
    NotificationCard(),
    NotificationCard(),
  ],
  '${AppText.earlier}': <Widget>[
    NotificationCard(),
    NotificationCard(),
    NotificationCard()
  ],
};

void weatherBottomSheet({BuildContext context}) {
  showMaterialModalBottomSheet(
      backgroundColor: AppColors.faintWhite,
      context: context,
      builder: (_) => Container(
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            AppText.forecastReport,
                            style: WeathermanAssets.customeTextStyle(
                                size: 14,
                                color: AppColors.textPurple,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: AppColors.backgroundColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppText.today,
                    style: WeathermanAssets.customeTextStyle(
                        size: 22,
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColors.textPurple.withOpacity(0.5))),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        VerticalForecastReportCard(
                          temp: "20",
                          time: "8:00 AM",
                        ),
                        VerticalForecastReportCard(
                          temp: "20",
                          time: "8:00 AM",
                        ),
                        VerticalForecastReportCard(
                          temp: "20",
                          time: "8:00 AM",
                        ),
                        VerticalForecastReportCard(
                          temp: "20",
                          time: "8:00 AM",
                        ),
                        VerticalForecastReportCard(
                          temp: "20",
                          time: "8:00 AM",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.nextForecast,
                        style: WeathermanAssets.customeTextStyle(
                            size: 22,
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          AppText.fiveDays,
                          style: WeathermanAssets.customeTextStyle(
                            size: 12,
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: AppColors.textPurple.withOpacity(0.5))),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    width: double.infinity,
                    child: Column(
                      children: [
                        HorizontalForecastReportCard(
                          temp: "20",
                          date: "April 16",
                        ),
                        HorizontalForecastReportCard(
                          temp: "20",
                          date: "April 16",
                        ),
                        HorizontalForecastReportCard(
                          temp: "20",
                          date: "April 16",
                        ),
                        HorizontalForecastReportCard(
                          temp: "20",
                          date: "April 16",
                        ),
                        HorizontalForecastReportCard(
                          temp: "20",
                          date: "April 16",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )));
}

void notificationBottomSheet({BuildContext context}) {
  showMaterialModalBottomSheet(
      backgroundColor: AppColors.faintWhite,
      context: context,
      builder: (_) => Container(
          decoration: BoxDecoration(
            color: AppColors.textWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Text(
                      AppText.yourNotification,
                      style: WeathermanAssets.customeTextStyle(
                          size: 14,
                          color: AppColors.textPurple,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 370,
                  child: GroupListView(
                    sectionsCount: _elements.keys.toList().length,
                    countOfItemInSection: (int section) {
                      return _elements.values.toList()[section].length;
                    },
                    itemBuilder: (BuildContext context, IndexPath index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                        child: _elements.values.toList()[index.section]
                            [index.index],
                      );
                    },
                    groupHeaderBuilder: (BuildContext context, int section) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          _elements.keys.toList()[section],
                          style: WeathermanAssets.customeTextStyle(
                              size: 10,
                              color: AppColors.textBlack.withOpacity(.5),
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: AppColors.backgroundColor.withOpacity(0.5),
                    ),
                    sectionSeparatorBuilder: (context, section) =>
                        SizedBox(height: 10),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )));
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key key, this.icon, this.daysAgo, this.weather})
      : super(key: key);
  final String daysAgo;
  final String weather;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SvgPicture.asset(
          icon ?? WeathermanAssets.dummySunIcon,
          height: 30,
        )),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  daysAgo ?? '10 minutes ago',
                  style: WeathermanAssets.customeTextStyle(
                      size: 10,
                      color: AppColors.textBlack.withOpacity(.5),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  weather ?? 'Its a sunny day in your location',
                  style: WeathermanAssets.customeTextStyle(
                      size: 14,
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ))
      ],
    );
  }
}
