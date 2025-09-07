import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  void _showEnlargedPass(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black.withOpacity(0.85),
        insetPadding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 1,
            maxScale: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'My Events',
                    style: GoogleFonts.caveat(
                      textStyle: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () => _showEnlargedPass(
                        context,
                        const EventPassCard(
                          eventName: 'RAIN\'25',
                          dateTime: 'June 12, 16:00 PM',
                          location: 'Dr.MGR University, Chennai',
                          ticketID: 'TCKT-9012',
                        ),
                      ),
                      child: const EventPassCard(
                        eventName: 'RAIN\'25',
                        dateTime: 'June 12, 16:00 PM',
                        location: 'Dr.MGR University, Chennai',
                        ticketID: 'TCKT-9012',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _showEnlargedPass(
                        context,
                        const EventPassCard(
                          eventName: 'Beyond the Hype',
                          dateTime: 'April 28, 6:30 PM',
                          location: 'Anna Auditorium, Chennai',
                          ticketID: 'TCKT-7812',
                          price: '\120.00 rs',
                        ),
                      ),
                      child: const EventPassCard(
                        eventName: 'Beyond the Hype',
                        dateTime: 'April 28, 6:30 PM',
                        location: 'Anna Auditorium, Chennai',
                        ticketID: 'TCKT-7812',
                        price: '\120.00 rs',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventPassCard extends StatelessWidget {
  final String eventName;
  final String dateTime;
  final String location;
  final String ticketID;
  final String? price;

  const EventPassCard({
    super.key,
    required this.eventName,
    required this.dateTime,
    required this.location,
    required this.ticketID,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            dateTime,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            'Ticket ID: $ticketID',
            style: const TextStyle(fontSize: 13, color: Colors.black45),
          ),
          if (price != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Price: $price',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
        ],
      ),
    );
  }
}


