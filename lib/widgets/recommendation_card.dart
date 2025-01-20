import 'package:ball_park/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade700,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  width: 80,
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(
                                8,
                              ),
                            ),
                          ),
                          child: Text(
                            weekday,
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Date
                        Text(
                          "$date $month",
                          style: TextStyle(
                            color: backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Horizontal Line
                        Container(
                          width: 100,
                          height: 1.5,
                          color: backgroundColor,
                        ),
                        const SizedBox(height: 6),
                        // Time
                        Text(
                          time,
                          style: GoogleFonts.lato(
                              fontSize: 16, color: backgroundColor),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
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
              color: customBlack,
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
                      // Participants
                      Row(
                        children: [
                          ...List.generate(3, (index) {
                            return Transform.translate(
                              offset: Offset(
                                  -8.0 * index, 0), // Dynamic translation
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(
                                  'https://picsum.photos/200/300?random=$index', // Different image for each index
                                ),
                              ),
                            );
                          }),
                          Transform.translate(
                            offset: const Offset(-24,
                                0), // Further offset for the '+7' CircleAvatar
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: const Text(
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
                      // Details Button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle details button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F2F30),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.more_vert, size: 16),
                        label: const Text(
                          'Details',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
