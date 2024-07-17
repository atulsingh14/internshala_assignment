import 'package:get/get.dart';

class FilterController extends GetxController {
  var profiles = <String>[].obs;
  var cities = <String>[].obs;
  var duration = ''.obs;

  // Method to add a profile to the list of selected profiles
  void addProfile(String profile) {
    if (profile.isNotEmpty && !profiles.contains(profile)) {
      profiles.add(profile);
    }
  }

  // Method to remove a profile from a list of profiles
  void removeProfile(String profile) {
    profiles.remove(profile);
  }

  // Method to add a city to a list of cities
  void addCity(String city) {
    if (city.isNotEmpty && !cities.contains(city)) {
      cities.add(city);
    }
  }

  // Method to remove a city from a list of selected cities
  void removeCity(String city) {
    cities.remove(city);
  }

  // Method to set a new duration value
  void setDuration(String newDuration) {
    duration.value = newDuration;
  }

  // Method to clear all the filters
  void clearFilters() {
    profiles.clear();
    cities.clear();
    duration.value = '';
  }
}
