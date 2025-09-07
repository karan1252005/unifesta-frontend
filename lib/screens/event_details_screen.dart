import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  // Google Form URL
  final String googleFormUrl = 'https://docs.google.com/forms/d/1OjOQ8Sxg_cI3KTpKd7z-gb21ymGlJW57ZjC0BmPHU8Y/viewform';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 54, 57, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3639),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Events Details',
          style: TextStyle(
            fontFamily: 'Caveat',
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Poster Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/event 1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Event Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3F4E4F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Name: HERTZ\'21 – National Level Virtual Symposium',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Date & Time: 12th April 2025 | 10:00 AM – 3:00 PM',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Venue: VIT, Chennai (Virtual)',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Events:\n• Technical: Paper Presentation, Brain Teaser, Techno Jam, Mind Cracker\n• Non-Technical: Meme Master, Muzica',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Highlights:\n• Free Registration\n• Exciting Cash Prizes',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Organized By:\nElectronics and Communication Engineering Department',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BOOK NOW Button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://docs.google.com/forms/d/1OjOQ8Sxg_cI3KTpKd7z-gb21ymGlJW57ZjC0BmPHU8Y/viewform');
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception('Could not launch $url');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


