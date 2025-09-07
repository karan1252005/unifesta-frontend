import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unifesta/screens/city.dart';

class FeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureBlock(
              heading: 'Discover Events',
              subtitle: 'Find events across multiple colleges in one place.',
            ),
            SizedBox(height: 30),
            FeatureBlock(
              heading: 'Easy Registration',
              subtitle: 'Register instantly with a single tap',
            ),
            SizedBox(height: 30),
            FeatureBlock(
              heading: 'Stay Updated',
              subtitle: 'Get reminders and notifications for upcoming events.',
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 109,
                height: 41,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CitySelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA5C9CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 26,
                      fontWeight: FontWeight.w600, 
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeatureBlock extends StatelessWidget {
  final String heading;
  final String subtitle;

  const FeatureBlock({required this.heading, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.caveat(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFFA5C9CA),
          ),
        ),
      ],
    );
  }
}







