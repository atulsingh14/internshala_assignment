import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_app/widgets/internship_card.dart';
import '../controller/internship_controller.dart';

class InternshipList extends StatelessWidget {
  final String searchQuery;
  final Map<String, String> filters;

  final InternshipController internshipController = Get.find();

  InternshipList({super.key, required this.searchQuery, required this.filters});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (internshipController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Apply filters and search query
      var filteredInternships =
          internshipController.internships.where((internship) {
        final matchesSearchQuery = searchQuery.isEmpty ||
            internship.title.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesProfile = filters['profile'] == null ||
            filters['profile']!.isEmpty ||
            internship.title
                .toLowerCase()
                .contains(filters['profile']!.toLowerCase());
        final matchesCity = filters['city'] == null ||
            filters['city']!.isEmpty ||
            internship.locations.any((location) => location
                .toLowerCase()
                .contains(filters['city']!.toLowerCase()));
        final matchesDuration = filters['duration'] == null ||
            filters['duration']!.isEmpty ||
            internship.duration.contains(filters['duration']!);

        return matchesSearchQuery &&
            matchesProfile &&
            matchesCity &&
            matchesDuration;
      }).toList();

      return ListView.builder(
        itemCount: filteredInternships.length,
        itemBuilder: (context, index) {
          return InternshipCard(internship: filteredInternships[index]);
        },
      );
    });
  }
}
