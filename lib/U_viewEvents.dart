import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of Events',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optional: Define a default font if you want to match the image's serif look.
        // You might need to import a custom font like GoogleFonts.
        // For demonstration, I'll use a basic style.
        fontFamily:
            'Roboto', // Or 'Georgia' or 'Merriweather' for serif look if available
      ),
      home: const EventListViewScreen(),
    );
  }
}

class EventListViewScreen extends StatelessWidget {
  const EventListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow for the app bar
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
            const SizedBox(height: 10), // Space from top
            // Main Page Title
            const Center(
              child: Text(
                'List of Events',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28, // Larger font size for main title
                  // fontFamily: 'YourSerifFont', // If matching a specific font
                ),
              ),
            ),
            const SizedBox(height: 20), // Space below title
            // Event List Placeholder (using an Expanded ListView.builder)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: 3, // Display 3 placeholder items for demonstration
                itemBuilder: (context, index) {
                  return _buildEventPlaceholderItem();
                },
              ),
            ),
            const SizedBox(height: 20), // Space above the action button
            // Edit Event Details Button
            _buildBlackButton(context, 'Edit Event Details', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit Event Details tapped!')),
              );
              // Navigate to an event editing screen
            }),
            const SizedBox(height: 20), // Space above back button
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

  // Helper function to build a single event placeholder item
  Widget _buildEventPlaceholderItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15), // Space between cards
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ), // Light border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section: dots and black line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 4,
                color: Colors.black, // Placeholder for dots
              ),
              Container(
                width: 150, // Length of the black line
                height: 4,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Middle section: highlighted grey box with location lines
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Highlighted grey background
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: Colors.black),
                    const SizedBox(width: 8),
                    Container(
                      width: 100,
                      height: 4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: Colors.black),
                    const SizedBox(width: 8),
                    Container(
                      width: 120,
                      height: 4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Bottom section: two shorter black lines
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 70, height: 4, color: Colors.black),
              Container(width: 50, height: 4, color: Colors.black),
            ],
          ),
        ],
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
