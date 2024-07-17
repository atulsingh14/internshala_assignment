import 'package:internshala_app/service.dart/api_service.dart';
import '../model/internship_model.dart';

/*
  Retrieves internship data as a JSON response from ApiService.getInternships(),
  extracts internship IDs and metadata, converts them into Internship objects,
  and returns a list of Internship objects.
*/

class InternshipService {
  static Future<List<Internship>> fetchInternships() async {
    final Map<String, dynamic> responseJson = await ApiService.getInternships();
    final List<dynamic> internshipIds = responseJson['internship_ids'];
    final Map<String, dynamic> internshipsMeta =
        responseJson['internships_meta'];

    List<Internship> internships = [];
    for (var id in internshipIds) {
      internships.add(Internship.fromJson(internshipsMeta[id.toString()]));
    }

    return internships;
  }
}
