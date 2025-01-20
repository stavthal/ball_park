import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bubble_indicator.dart';

class LandingThirdScreen extends StatelessWidget {
  const LandingThirdScreen({super.key});

  static String title = "Enjoy the game";
  static String body = "Talk to your team, manage them and enjoy the game!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.amber,
            ),
            label: Text(
              'Back',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () => context.push('landing_three'),
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.amber,
            ),
            iconAlignment: IconAlignment.end,
            label: Text(
              'Next',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/landing_3.png',
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  body,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.amber),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                // Bubble Indicator
                const BubbleIndicator(
                  totalBubbles: 3,
                  activeIndex: 2,
                  alignment: MainAxisAlignment.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
