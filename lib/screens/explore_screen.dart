import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> eventNames = [
    "AI Workshop",
    "Robo Soccer",
    "Hackathon 2.0",
    "Digital Art Contest",
    "Code Combat",
    "Music Fiesta",
    "Tech Talk Series",
    "Startup Pitch",
  ];

  final List<String> categories = [
    "Technical",
    "Workshop",
    "Cultural",
    "Sports",
    "Non Technical",
  ];

  TextEditingController searchController = TextEditingController();
  List<String> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = eventNames; // Initially, show all events
  }

  void filterEvents(String query) {
    final results = eventNames.where((event) {
      return event.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      filteredEvents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back and Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Explore The Event",
                    style: GoogleFonts.caveat(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 40,
                width: 360,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: filterEvents,
                  decoration: InputDecoration(
                    hintText: "Search here.....",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // List of Events
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: filteredEvents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      filteredEvents[index],
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 16),
                    ),
                  );
                },
              ),
            ),

            // Category-Based Events
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Color(0xFFEDEDED),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category-Based Events",
                    style: GoogleFonts.caveat(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: categories.map((category) {
                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2C3639),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(category),
                      );
                    }).toList(),
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

