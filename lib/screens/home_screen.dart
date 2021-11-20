import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:weatherman/core/model/search_result/search_result.dart';
import 'package:weatherman/core/state_management/location_getter.dart';
import 'package:weatherman/custom_widget/bottom_sheets.dart';
import 'package:weatherman/screens/search_screen.dart';
import 'package:weatherman/utils/app_colors.dart';
import 'package:weatherman/utils/app_text.dart';

import '../utils/weatherman_assets.dart';

class WeatherManHomeScreen extends StatefulWidget {
  const WeatherManHomeScreen({Key key}) : super(key: key);

  @override
  _WeatherManHomeScreenState createState() => _WeatherManHomeScreenState();
}

class _WeatherManHomeScreenState extends State<WeatherManHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LocationGetter>(context, listen: false).getCurrentLocation();

      Provider.of<LocationGetter>(context, listen: false).getLocationDetails(
          Provider.of<LocationGetter>(context, listen: false).currentPosition);
    });
    //
  }

  @override
  void didUpdateWidget(covariant WeatherManHomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    Provider.of<LocationGetter>(context, listen: false).getCurrentLocation();
    Provider.of<LocationGetter>(context, listen: false).getLocationDetails(
        Provider.of<LocationGetter>(context, listen: false).currentPosition);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        SearchResult pos = await Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchScreen()));

                        Provider.of<LocationGetter>(context, listen: false)
                            .callGetData(
                                lon: '${pos.position.lon ?? ""}',
                                lat: '${pos.position.lat ?? ""}',
                                unit: "metric");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.faintWhite,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              WeathermanAssets.locationIcon,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${Provider.of<LocationGetter>(context).currentPlace.locality ?? ""}, ${Provider.of<LocationGetter>(context).currentPlace.country ?? ""}',
                              style: WeathermanAssets.customeTextStyle(
                                  size: 14, color: AppColors.textWhite),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        notificationBottomSheet(context: context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.faintWhite,
                        ),
                        child: SvgPicture.asset(
                          WeathermanAssets.notificationIcon,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .09,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.faintWhite,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.textWhite.withOpacity(.5),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: SvgPicture.asset(
                              WeathermanAssets.cloudIcon,
                              height: 75,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.today,
                                style: WeathermanAssets.customeTextStyle(
                                  size: 24,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Mon, 26 Apr',
                                style: WeathermanAssets.customeTextStyle(
                                  size: 12,
                                  color: AppColors.textWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${Provider.of<LocationGetter>(context).weatherData.current.temp ?? ""}',
                            style: WeathermanAssets.customeTextStyle(
                              size: 80,
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppText.centigrade,
                            style: WeathermanAssets.customeTextStyle(
                              size: 19,
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${Provider.of<LocationGetter>(context).currentPlace.locality ?? ""}, ${Provider.of<LocationGetter>(context).currentPlace.country ?? ""}',
                            style: WeathermanAssets.customeTextStyle(
                                size: 14, color: AppColors.textWhite),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColors.textWhite,
                                shape: BoxShape.circle),
                            height: 8,
                          ),
                          Text(
                            '2:00 p.m',
                            style: WeathermanAssets.customeTextStyle(
                                size: 14, color: AppColors.textWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .09,
                ),
                GestureDetector(
                  onTap: () {
                    weatherBottomSheet(context: context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.faintWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppText.forecastReport,
                          style: WeathermanAssets.customeTextStyle(
                              size: 18,
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 20,
                          color: AppColors.textWhite,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
