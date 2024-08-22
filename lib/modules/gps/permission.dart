import 'package:bike_route/utils/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void permission() async {
  final Permission permission = Permission.location;
  if (await permission.isDenied) {
    final result = await permission.request();
    if (result.isGranted) {
      logger.severe('Permission is granted');
    } else if (result.isDenied) {
      logger.severe('Permission is denied');
    } else if (result.isPermanentlyDenied) {
      logger.severe('Permission is permanently denied');
    }
  }
  // final PermissionStatus requestStatus = await Permission.location.request();
  // final PermissionStatus status = await Permission.location.status;

  // if (requestStatus.isGranted && status.isLimited) {
  //   logger.severe("isGranted");
  //   if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  //     var position = await Geolocator.getCurrentPosition();
  //     logger.severe("serviceStatusIsEnabled position = ${position.toString()}");
  //   } else {
  //     logger.severe("serviceStatusIsDisabled");
  //   }
  // } else if (requestStatus.isPermanentlyDenied || status.isPermanentlyDenied) {
  //   logger.severe("isPermanentlyDenied");
  //   openAppSettings();
  // } else if (status.isRestricted) {
  //   logger.severe("isRestricted");
  //   openAppSettings();
  // } else if (status.isDenied) {
  //   logger.severe("isDenied");
  // }
  // logger.severe("requestStatus ${requestStatus.name}");
  // logger.severe("status ${status.name}");
}
