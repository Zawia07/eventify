import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optional: Define a default font if you want to match the image's serif look.
        // You might need to import a custom font for exact match.
        // For demonstration, I'll use a basic style.
        fontFamily:
            'Roboto', // Or 'Georgia' or 'Merriweather' for serif look if available
      ),
      home: const ManageEventScreen(),
    );
  }
}

class ManageEventScreen extends StatelessWidget {
  const ManageEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow for the app bar
        title: const Text(
          'Manage Event',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22, // Adjust font size to match the image
            // You might need to import a custom font for exact match
            // fontFamily: 'YourSerifFont',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black, size: 28),
            onPressed: () {
              // Handle settings icon tap
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Settings tapped!')));
            },
          ),
          const SizedBox(width: 16), // Padding for the icon
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20), // Space below the title
            _buildBlackButton(context, 'Event Title Field', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Event Title Field tapped!')),
              );
              // Navigate to an edit screen or open a dialog
            }),
            const SizedBox(height: 15), // Spacing between buttons
            _buildBlackButton(context, 'Event Description Field', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Event Description Field tapped!'),
                ),
              );
            }),
            const SizedBox(height: 15),
            _buildBlackButton(context, 'Event Address Field', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Event Address Field tapped!')),
              );
            }),
            const SizedBox(height: 15),
            _buildBlackButton(context, 'Upload Location Picture', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Upload Location Picture tapped!'),
                ),
              );
              // Implement image upload logic
            }),
            const SizedBox(height: 15),
            _buildBlackButton(context, 'View Attendee List Button', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('View Attendee List Button tapped!'),
                ),
              );
              // Navigate to attendee list screen
            }),

            const Spacer(), // Pushes content towards the top and back button to the bottom
            // Back Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle back navigation
                  Navigator.pop(context); // Goes back to the previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  foregroundColor: Colors.white, // Icon color
                  shape: const CircleBorder(), // Circular shape
                  padding: const EdgeInsets.all(
                    18,
                  ), // Padding inside the button
                  minimumSize: const Size(60, 60), // Ensure it's a good size
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 28,
                ), // Back arrow icon
              ),
            ),
            const SizedBox(height: 20), // Space below the back button
          ],
        ),
      ),
    );
  }

  // Helper function to build the common black buttons
  Widget _buildBlackButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Background color
        foregroundColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}
