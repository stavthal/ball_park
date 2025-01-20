import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/event_card.dart';
import '../../widgets/recommendation_card.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Event data
    final events = [
      {
        'title': 'Lorem ipsum dolor sit amet',
        'date': '5',
        'month': 'July',
        'time': '19:00',
        'location': 'Palaio Faliro',
        'organizer': 'Sotiris Angelopoulos',
        'status': 'Going',
        'statusColor': Colors.green,
        'participantCount': '5/12',
        'participantAvatars': [
          'assets/images/avatar1.png',
          'assets/images/avatar2.png',
          'assets/images/avatar3.png',
        ],
        'sportType': 'football',
        'weekday': 'Friday',
      },
      {
        'title': 'Lorem ipsum dolor sit amet',
        'date': '5',
        'month': 'July',
        'time': '19:00',
        'location': 'Palaio Faliro',
        'organizer': 'Sotiris Angelopoulos',
        'status': 'Pending',
        'statusColor': Colors.amber,
        'participantCount': '5/12',
        'participantAvatars': [
          'assets/images/avatar1.png',
          'assets/images/avatar2.png',
          'assets/images/avatar3.png',
        ],
        'sportType': 'tennis',
        'weekday': 'Friday',
      },
    ];

    final recommendations = [
      {
        'title': 'Lorem ipsum dolor sit amet',
        'date': '5',
        'month': 'July',
        'time': '19:00',
        'location': 'Palaio Faliro',
        'organizer': 'Sotiris Angelopoulos',
        'image': 'assets/images/static_venue.png',
        'weekday': 'Friday',
        'sportIcon': Icons.sports_soccer,
        'backgroundColor': Colors.green,
      },
      {
        'title': 'Another Event',
        'date': '6',
        'month': 'July',
        'time': '20:00',
        'location': 'Nea Smyrni',
        'organizer': 'John Doe',
        'image': 'assets/images/static_venue.png',
        'weekday': 'Saturday',
        'sportIcon': Icons.sports_tennis,
        'backgroundColor': Colors.blue,
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                const Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                // Action Buttons
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Handle list view action
                        },
                        icon: const Icon(Icons.view_list, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F2F30), // Dark grey background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Handle calendar view action
                        },
                        icon: const Icon(Icons.calendar_today,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Horizontal Line
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF313131),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Event List
            Column(
              children: List.generate(events.length, (index) {
                final event = events[index];
                return EventCard(
                  title: event['title'] as String,
                  date: event['date'] as String,
                  month: event['month'] as String,
                  time: event['time'] as String,
                  location: event['location'] as String,
                  organizer: event['organizer'] as String,
                  status: event['status'] as String,
                  statusColor: event['statusColor'] as Color,
                  participantCount: event['participantCount'] as String,
                  participantAvatars:
                      event['participantAvatars'] as List<String>,
                  sportType: event['sportType'] as String,
                  weekday: event['weekday'] as String,
                );
              }),
            ),
            const SizedBox(height: 16),
            // See More Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle "See more" action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF2F2F30), // Match card background
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Text(
                  'See more',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Recommendations Section
            const Text(
              'Recommendations',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            CarouselSlider.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index, realIndex) {
                final recommendation = recommendations[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RecommendationCard(
                    title: recommendation['title'] as String,
                    date: recommendation['date'] as String,
                    month: recommendation['month'] as String,
                    time: recommendation['time'] as String,
                    location: recommendation['location'] as String,
                    organizer: recommendation['organizer'] as String,
                    imagePath: recommendation['image'] as String,
                    weekday: recommendation['weekday'] as String,
                    sportIcon: recommendation['sportIcon'] as IconData,
                    backgroundColor: recommendation['backgroundColor'] as Color,
                  ),
                );
              },
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
