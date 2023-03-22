// import 'package:flutter_test/flutter_test.dart';
// import 'package:islamicapp/data/service/api_services/prayer_time_api_service/prayer_time_service.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import '../prayer_mock_data.dart';
// import 'prayer_time_service_test.mocks.dart';
//
// @GenerateMocks([PrayerTimeService])
// void main() {
//   late PrayerTimeService service;
//
//   setUp(
//     () {
//       service = MockPrayerTimeService();
//     },
//   );
//   test(
//     'test prayer time service class',
//     () async {
//       final result = generateResponsePrayerModel();
//       when(service.getPrayerTimes(30.0444, 31.2357, 0 , ))
//           .thenAnswer((realInvocation) async => result);
//
//       final expected = result;
//       expect(await service.getPrayerTimes(30.0444, 31.2357, 0), expected);
//     },
//   );
// }
