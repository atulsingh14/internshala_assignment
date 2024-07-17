import 'package:flutter/material.dart';
import '../model/internship_model.dart';

class InternshipCard extends StatelessWidget {
  final Internship internship;

  // ignore: use_key_in_widget_constructors
  const InternshipCard({required this.internship});

  Color getBackgroundLabelColor(String label) {
    if (label == 'Today' || label == 'Yesterday') {
      return Colors.green[50]!;
    } else if (label.contains('day')) {
      int days = int.parse(label.split(' ')[0]);
      if (days <= 2) {
        return Colors.green[50]!;
      } else if (days <= 7) {
        return Colors.blue[50]!;
      }
    }
    return Colors.grey[100]!;
  }

  Color getTextLabelColor(String label) {
    if (label == 'Today' || label == 'Yesterday') {
      return Colors.green[700]!;
    } else if (label.contains('day')) {
      int days = int.parse(label.split(' ')[0]);
      if (days <= 2) {
        return Colors.green[700]!;
      } else if (days <= 7) {
        return Colors.blue[700]!;
      }
    }
    return Colors.grey[700]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (internship.labelsAppInCard.contains("Actively hiring"))
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.bolt, size: 16, color: Colors.green[700]),
                        const SizedBox(width: 4),
                        Text(
                          'Actively hiring',
                          style:
                              TextStyle(color: Colors.green[700], fontSize: 14),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              internship.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              internship.company,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.grey[900]),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    internship.locations.join(", "),
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.play_circle_fill, size: 18, color: Colors.grey[900]),
                const SizedBox(width: 6),
                Text(
                  internship.startDate,
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
                const SizedBox(width: 18),
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[900]),
                const SizedBox(width: 6), // Reduced space here
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${internship.duration}',
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(
                  Icons.money,
                  size: 18,
                  color: Colors.grey[900],
                ),
                const SizedBox(width: 6),
                Text(
                  internship.stipend,
                  style: TextStyle(color: Colors.grey[900], fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 15),
            if (internship.labelsAppInCard.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  internship.labelsAppInCard.first,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
