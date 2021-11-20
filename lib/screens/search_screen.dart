import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherman/core/model/search_result/search_result.dart';
import 'package:weatherman/core/state_management/location_getter.dart';
import 'package:weatherman/utils/app_colors.dart';
import 'package:weatherman/utils/app_text.dart';
import 'package:weatherman/utils/weatherman_assets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key}) : super(key: key);

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.location_pin,
                        size: 30,
                        color: AppColors.red,
                      ),
                    ),
                    Text(
                      "Search City",
                      style: WeathermanAssets.customeTextStyle(
                          size: 24, color: AppColors.backgroundColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        size: 30,
                        color: AppColors.backgroundColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    Provider.of<LocationGetter>(context, listen: false)
                        .searchLocation(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Provider.of<LocationGetter>(context).searchList == null
                    ? Container()
                    : Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: Provider.of<LocationGetter>(context)
                              .searchList
                              .length,
                          itemBuilder: (_, index) {
                            SearchResult s =
                                Provider.of<LocationGetter>(context)
                                    .searchList[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: SearchItemcard(
                                onpress: () {
                                  Navigator.of(context).pop(s);
                                },
                                country: s.address.country,
                                city: s.address.countrySubdivision,
                                place: s.address.municipality,
                              ),
                            );
                          },
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

class SearchItemcard extends StatelessWidget {
  const SearchItemcard(
      {Key key, this.city, this.country, this.place, this.onpress})
      : super(key: key);
  final String place;
  final String city;
  final String country;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.textPurple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            "${place}",
            style: WeathermanAssets.customeTextStyle(
                size: 20,
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: [
              Text(
                AppText.city,
                style: WeathermanAssets.customeTextStyle(
                    size: 12, color: AppColors.textPurple),
              ),
              Text(
                "${city}",
                style: WeathermanAssets.customeTextStyle(
                    size: 12, color: AppColors.textPurple),
              ),
            ],
          ),
          trailing: Column(
            children: [
              Text(
                AppText.country,
                style: WeathermanAssets.customeTextStyle(
                    size: 12, color: AppColors.textPurple),
              ),
              Text(
                "${country}",
                style: WeathermanAssets.customeTextStyle(
                    size: 12, color: AppColors.textPurple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
