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
    return Card(
      elevation: 1,
      margin: EdgeInsetsDirectional.all(8),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              Icons.cloud_queue_sharp,
              size: 28,
              color: AppColors.mainColor,
            ),
          ),
          Expanded(
            child: Text(
              prayerName,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor),
            ),
          ),
          Expanded(
            child: Text(
              prayerTime,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor),
            ),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 28,
                  color: AppColors.secondTextColor,
                )),
          )
        ],
      ),
    );
  }
}
