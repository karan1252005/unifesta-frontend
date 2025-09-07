import 'package:flutter/material.dart';
import 'package:unifesta/screens/spinscreen.dart'; 
import 'package:unifesta/screens/welcome_screen.dart';
import 'package:unifesta/screens/features_screen.dart';
import 'package:unifesta/screens/city.dart';
import 'package:unifesta/screens/signup.dart';
import 'package:unifesta/screens/login.dart';
import 'package:unifesta/screens/home_screen.dart';
import 'package:unifesta/screens/explore_screen.dart'; 
import 'package:unifesta/screens/my_events_screen.dart'; 
import 'package:unifesta/screens/event_details_screen.dart';
import 'package:unifesta/screens/profile_screen.dart';


void main() {
  runApp(UnifestaApp());
}

class UnifestaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unifesta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => SpinScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/features': (context) => FeaturesScreen(),
        '/city': (context) => CitySelectionScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/explore': (context) => ExploreScreen(),
        '/myevents': (context) => MyEventsScreen(),
        '/eventdetails': (context) => const EventDetailsScreen(),
        '/profile': (context) => ProfileScreen(),

      },
    );
  }
}










