import 'package:islamicapp/data/models/prayer_time_model/date_hijri.dart';
import 'package:islamicapp/data/models/prayer_time_model/designation.dart';
import 'package:islamicapp/data/models/prayer_time_model/gregorian.dart';
import 'package:islamicapp/data/models/prayer_time_model/location.dart';
import 'package:islamicapp/data/models/prayer_time_model/method_calculating_times.dart';
import 'package:islamicapp/data/models/prayer_time_model/month.dart';
import 'package:islamicapp/data/models/prayer_time_model/offset_prayer_time.dart';
import 'package:islamicapp/data/models/prayer_time_model/params.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_data.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_date.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_meta_data.dart';
import 'package:islamicapp/data/models/prayer_time_model/prayer_time.dart';
import 'package:islamicapp/data/models/prayer_time_model/response_prayer_data_model.dart';
import 'package:islamicapp/data/models/prayer_time_model/week_day.dart';

ResponsePrayerModel generateResponsePrayerModel() {
// 30.0444° N, 31.2357° E
  PrayerTimings prayerTimings = PrayerTimings(
      fajr: "05:01",
      sunrise: "06:28",
      dhuhr: "12:08",
      asr: "15:22",
      sunset: "17:49",
      maghrib: "17:49",
      isha: "19:07",
      imsak: "04:51",
      midNight: "00:09",
      firstThird: "22:02",
      lastThird: "02:15");
  Weekday weekdayHijir = Weekday(english: "Al Khamees", arabic: "الخميس");
  Month monthHijir = Month(number: 8, english: "Shaʿbān", arabic: "شَعْبان");
  Month monthGregorian = Month(number: 2, english: "February", arabic: null);
  Designation designationHIjir =
      Designation(abbreviated: "AH", expanded: "Anno Hegirae");
  Designation designationGreg =
      Designation(abbreviated: "AD", expanded: "Anno Domini");
  DateInHijri dateInHijri = DateInHijri(
      date: "02-08-1444",
      format: "DD-MM-YYYY",
      dayNumber: "02",
      weekday: weekdayHijir,
      month: monthHijir,
      year: "1444",
      designation: designationHIjir,
      holidays: []);
  Weekday weekdayGregorian = Weekday(english: 'Thursday', arabic: null);
  DateGregorian gregorian = DateGregorian(
      date: "23-02-2023",
      format: "23-02-2023",
      day: "23",
      weekday: weekdayGregorian,
      month: monthGregorian,
      year: 'Gregorian',
      designation: designationGreg);
  PrayerDate prayerDate = PrayerDate(
      dateReadable: "23 Feb 2023",
      timestamp: "1677144282",
      hijri: dateInHijri,
      gregorian: gregorian);
  Params params = Params(Fajr: 19.5, Isha: 17.5);

  Location location = Location(latitude: 30.0444196, longitude: 31.2357116);
  MethodCalculatingTimes methodCalculatingTimes = MethodCalculatingTimes(
      id: 5,
      name: "Egyptian General Authority of Survey",
      params: params,
      location: location);
  OffsetPrayerTime offset = OffsetPrayerTime(
      imsak: 0,
      fajr: 0,
      sunrise: 0,
      dhuhr: 0,
      asr: 0,
      maghrib: 0,
      sunset: 0,
      isha: 0,
      midNight: 0);
  PrayerMetaData prayerMetaData = PrayerMetaData(
      latitude: 30.0444,
      longitude: 31.2357,
      timezone: 'Africa/Cairo',
      method: methodCalculatingTimes,
      latitudeAdjustmentMethod: 'ANGLE_BASED',
      midnightMode: 'STANDARD',
      school: 'STANDARD',
      offset: offset);
  PrayerData prayerData = PrayerData(
      prayerTimings: prayerTimings,
      prayerDate: prayerDate,
      prayerMetaData: prayerMetaData);
  ResponsePrayerModel responsePrayerModel =
      ResponsePrayerModel(code: 200, status: 'OK', data: prayerData);
  return responsePrayerModel;
}
