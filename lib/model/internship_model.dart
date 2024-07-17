class Internship {
  final int id;
  final String title;
  final String company;
  final List<String> locations;
  final String duration;
  final String stipend;
  final bool isActivelyHiring;
  final bool hasJobOffer;
  final String postedTimeAgo;
  final String startDate;
  final String profileName;
  final List<String> labelsAppInCard;
  final String? ppoLabelValue;

  Internship({
    required this.id,
    required this.title,
    required this.company,
    required this.locations,
    required this.duration,
    required this.stipend,
    required this.isActivelyHiring,
    required this.hasJobOffer,
    required this.postedTimeAgo,
    required this.startDate,
    required this.profileName,
    required this.labelsAppInCard,
    this.ppoLabelValue,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'],
      title: json['title'],
      company: json['company_name'],
      locations: List<String>.from(json['location_names']),
      duration: json['duration'],
      stipend: json['stipend']['salary'],
      isActivelyHiring: json['application_status_message']['to_show'],
      hasJobOffer: json['is_ppo'],
      postedTimeAgo: json['posted_by_label'],
      startDate: json['start_date'],
      profileName: json['profile_name'],
      labelsAppInCard: List<String>.from(json['labels_app_in_card']),
      ppoLabelValue: json['ppo_label_value'],
    );
  }
}
