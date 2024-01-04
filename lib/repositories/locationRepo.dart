
import 'package:weatherly/constants.dart';
import 'package:weatherly/domain/locationApi_services.dart';

import '../models/location.dart';

class LocationRepo{
  final LocationApiServices locationApiServices;
  LocationRepo({required this.locationApiServices});

 Future<Location> getDeviceLocationByIP(String ip) async{
   Location deviceLocation = await locationApiServices.getDeviceLocationByIP(getApiKey(), ip);
   print(deviceLocation.localizedName);
   return deviceLocation;
 }
}