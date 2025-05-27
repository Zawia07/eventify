import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optional: Define a default font if you want to match the image's serif look.
        // You might need to import a custom font for exact match.
        // For demonstration, I'll use a basic style.
        fontFamily:
            'Roboto', // Or 'Georgia' or 'Merriweather' for serif look if available
      ),
      home: const CreateEventScreen(),
    );
  }
}

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow for the app bar
        // No title text explicitly shown in the image, just blank space then settings icon
        // If a title is desired, uncomment and modify below:
        // title: const Text(
        //   'Create Event', // Or similar title
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        // ),
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
            const SizedBox(height: 10), // Small space from top if no title
            _buildBlackButton(context, 'Event Title Lists', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Event Title Lists tapped!')),
              );
              // Navigate to a screen to select or create a title
            }),
            const SizedBox(height: 15), // Spacing between elements
            _buildBlackButton(context, 'Date & Time Picker', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Date & Time Picker tapped!')),
              );
              // Show date/time picker dialogs
            }),
            const SizedBox(height: 15),
            _buildBlackButton(context, 'Location Input', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Location Input tapped!')),
              );
              // Open a map or location input form
            }),
            const SizedBox(height: 25), // More space before the description box
            // Description Box label
            const Text(
              'Description Box',
              style: TextStyle(
                color: Colors.grey, // Grey color as in the image
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // fontFamily: 'YourSerifFont', // If matching a specific font
              ),
              textAlign: TextAlign.center, // Center text based on image
            ),
            const SizedBox(height: 15),

            // Description input placeholder (would be a TextField in a real app)
            Container(
              height: 120, // Height of the grey box in the image
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Light grey color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              // In a real app, this would be a TextField:
              // child: TextField(
              //   maxLines: null, // Allows multiline input
              //   keyboardType: TextInputType.multiline,
              //   decoration: InputDecoration(
              //     hintText: 'Enter event description...',
              //     border: InputBorder.none,
              //     contentPadding: EdgeInsets.all(16.0),
              //   ),
              // ),
            ),
            const SizedBox(height: 25), // Space after description box

            _buildBlackButton(context, 'Upload Image', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Upload Image tapped!')),
              );
              // Implement image upload logic
            }),
            const SizedBox(height: 15),
            _buildBlackButton(context, 'Post Event', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post Event tapped!')),
              );
              // Handle event creation logic
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
