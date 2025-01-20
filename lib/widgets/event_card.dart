import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String month;
  final String time;
  final String location;
  final String organizer;
  final String status;
  final Color statusColor;
  final String participantCount;
  final List<String> participantAvatars;
  final String sportType; // New parameter for sport type
  final String weekday; // New parameter for dynamic weekday

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.month,
    required this.time,
    required this.location,
    required this.organizer,
    required this.status,
    required this.statusColor,
    required this.participantCount,
    required this.participantAvatars,
    required this.sportType,
    required this.weekday,
  });

  // Method to get sport-specific icon
  IconData _getSportIcon() {
    switch (sportType.toLowerCase()) {
      case 'football':
        return Icons.sports_soccer;
      case 'tennis':
        return Icons.sports_tennis;
      default:
        return Icons.sports;
    }
  }

  // Method to get sport-specific color
  Color _getSportColor() {
    switch (sportType.toLowerCase()) {
      case 'football':
        return const Color(0xFFA8F09B); // Green for football
      case 'tennis':
        return const Color(0xFFADD8E6); // Blue for tennis
      default:
        return Colors.grey; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 0,
      color: const Color(0xFF2F2F30), // Match the dark background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Section
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color:
                        _getSportColor(), // Dynamic color based on sport type
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
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  month,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Main Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:
                              _getSportColor(), // Dynamic color based on sport type
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getSportIcon(), // Dynamic icon based on sport type
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Organizer and Location
                  Text(
                    organizer,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Participants and Status
                  Row(
                    children: [
                      // Participants
                      Row(
                        children: [
                          Text(
                            participantCount,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          ...participantAvatars.map((avatar) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(avatar),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                      const Spacer(),
                      // Status
                      Row(
                        children: [
                          Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.check_circle,
                            color: statusColor,
                            size: 16,
                          ),
                        ],
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
