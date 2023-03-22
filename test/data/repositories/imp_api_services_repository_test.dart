// import 'package:flutter_test/flutter_test.dart';
// import 'package:islamicapp/config/injection.dart';
// import 'package:islamicapp/data/repositories/imp_api_services_repository.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import '../prayer_mock_data.dart';
// import 'imp_api_services_repository_test.mocks.dart';
//
// @GenerateMocks([ImpApiServicesRepository])
// main() {
//   late ImpApiServicesRepository impApiServicesRepository;
//   setUp(
//         () {
//       setupGetIt();
//       impApiServicesRepository = MockImpApiServicesRepository();
//     },
//   );
//
//   test(
//     'test Prayer service repo which ',
//         () async {
//       final result = generateResponsePrayerModel();
//
//       when(impApiServicesRepository.getPrayerTimes(
//           latitude: 30.0444,
//           longitude: 31.2357,
//           methodToCalculatePrayerTime: 0))
//           .thenAnswer((realInvocation) async => result);
//
//       final expected = result;
//       expect(
//           await impApiServicesRepository.getPrayerTimes(
//               latitude: 30.0444,
//               longitude: 31.2357,
//               methodToCalculatePrayerTime: 0),
//           expected);
//     },
//   );
// }
