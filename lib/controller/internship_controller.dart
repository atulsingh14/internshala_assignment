import 'package:get/get.dart';

import '../model/internship_model.dart';
import '../service.dart/internship_service.dart';

class InternshipController extends GetxController {
  var internships = <Internship>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchInternships();
    super.onInit();
  }

  /*
    fetches internship data from a service and Updates the list with the 
    fetched data, and manages the loading state ('isLoading') to indicate
    whether data fetching is in progress or completed.
  */

  void fetchInternships() async {
    try {
      isLoading(true);
      var internshipList = await InternshipService.fetchInternships();
      internships.value = internshipList;
    } finally {
      isLoading(false);
    }
  }
}
