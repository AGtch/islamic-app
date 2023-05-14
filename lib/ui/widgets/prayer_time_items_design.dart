import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class PrayerTimeItemDesign extends StatelessWidget {
  String prayerTime;
  String prayerName;

  PrayerTimeItemDesign(
      {Key? key, required this.prayerTime, required this.prayerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 1,
        margin: const EdgeInsetsDirectional.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              prayerName,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor),
            ),
            Text(
              prayerTime,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 28,
                  color: AppColors.secondTextColor,
                ))
          ],
        ),
      ),
    );
  }
}
