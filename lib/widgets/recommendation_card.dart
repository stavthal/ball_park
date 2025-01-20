import 'package:ball_park/main.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String title;
  final String date;
  final String month;
  final String time;
  final String location;
  final String organizer;
  final String imagePath;
  final String weekday;
  final IconData sportIcon;
  final Color backgroundColor;

  const RecommendationCard({
    super.key,
    required this.title,
    required this.date,
    required this.month,
    required this.time,
    required this.location,
    required this.organizer,
    required this.imagePath,
    required this.weekday,
    required this.sportIcon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Optional to keep the background color
        borderRadius: BorderRadius.circular(16), // Match card's radius
        border: Border.all(
          color: Colors.grey.shade700, // Slight grey border color
          width: 1, // Border thickness
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // Match the container's radius
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Stack(
              children: [
                // Background Image
                Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Weekday Overlay
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      weekday,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                // Sport Icon Overlay
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      sportIcon,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            // Bottom Details Section
            Container(
              color: customBlack, // Match the card's background color
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Organizer and Location
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.grey, size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '$organizer, $location',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Date and Participants Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date and Time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$date $month',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // Participants
                      Row(
                        children: [
                          ...List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  'assets/images/avatar${index + 1}.png',
                                ),
                              ),
                            );
                          }),
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: Text(
                                '+7',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Details Button and Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle details button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F2F30),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                        child: const Text('Details'),
                      ),
                      PopupMenuButton<String>(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'hide',
                            child: Text('Hide'),
                          ),
                          const PopupMenuItem(
                            value: 'report',
                            child: Text('Report'),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
