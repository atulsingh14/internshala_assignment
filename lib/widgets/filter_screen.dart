import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/filter_controller.dart';

class FiltersScreen extends StatelessWidget {
  final FilterController filtersController = Get.find();
  final List<int> durations = [1, 2, 3, 4, 6, 12, 24, 36];
  final List<String> availableProfiles = [
    'Developer',
    'Designer',
    'Marketing',
    'Content Writer'
  ];

  // In an ideal condition these values would be dynamically
  //extracted from a service to only show data that
  // matches the preference provided by the user.
  // I have just created a rough version of the filter

  final List<String> availableCities = [
    'New Delhi',
    'Mumbai',
    'Bangalore',
    'Hyderabad'
  ];

  FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color:
                    Colors.white, // Ensure the space below the app bar is white
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PROFILE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      return Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: availableProfiles.map((profile) {
                          return FilterChip(
                            label: Text(profile),
                            selected:
                                filtersController.profiles.contains(profile),
                            onSelected: (selected) {
                              if (selected) {
                                filtersController.addProfile(profile);
                              } else {
                                filtersController.removeProfile(profile);
                              }
                            },
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'CITY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: availableCities.map((city) {
                    return FilterChip(
                      label: Text(city),
                      selected: filtersController.cities.contains(city),
                      onSelected: (selected) {
                        if (selected) {
                          filtersController.addCity(city);
                        } else {
                          filtersController.removeCity(city);
                        }
                      },
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 30),
              const Text(
                'DURATION (IN MONTHS)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return DropdownButtonFormField<int>(
                  value: filtersController.duration.value.isEmpty
                      ? null
                      : int.parse(filtersController.duration.value),
                  items: durations.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Container(
                        color: Colors.white,
                        child: Text(value.toString()),
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    hintText: 'Choose Duration',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    filtersController.setDuration(value.toString());
                  },
                  dropdownColor: Colors.white,
                );
              }),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        filtersController.clearFilters();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        foregroundColor: Colors.blue,
                        side: const BorderSide(color: Colors.blue),
                      ),
                      child: const Text('Clear all'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back(result: {
                          'profile': filtersController.profiles.join(', '),
                          'city': filtersController.cities.join(', '),
                          'duration': filtersController.duration.value,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Apply',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
