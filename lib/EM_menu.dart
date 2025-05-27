import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemUiOverlayStyle

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // If you want to use a specific font to match the image:
        // fontFamily: 'Roboto', // Or 'serif' if you have one, or custom font
      ),
      home: const MenuScreen(), // Set MenuScreen as the home screen
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This makes the status bar icons (time, battery, signal) dark
    // so they are visible against the white app bar/background.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Transparent status bar
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white, // Ensure the background is white
      appBar: AppBar(
        // To make the app bar look clean and blend with the background
        backgroundColor: Colors.white,
        elevation: 0, // Removes the shadow below the app bar
        centerTitle: true, // Centers the title text
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black, // Title text color
            fontSize: 28, // Larger font size for the title
            fontWeight: FontWeight.bold, // Bold font as per the image
            // Note: For a true 'serif' look, you might need to add a custom font.
            // Default fonts might not match exactly.
            fontFamily: 'RobotoSerif', // Example: if you add a Google Font
          ),
        ),
        actions: [
          // Settings icon on the right
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black, // Settings icon color
            iconSize: 30, // Larger icon size
            onPressed: () {
              // TODO: Implement settings action
              print('Settings icon pressed!');
            },
          ),
          const SizedBox(width: 16), // Padding from the right edge
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ), // Overall horizontal padding for content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Makes buttons take full width
          children: [
            const SizedBox(
              height: 120,
            ), // Space from the top / below the app bar
            // Create Event Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement navigation or action for Create Event
                print('Create Event button pressed!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Black background for the button
                foregroundColor: Colors.white, // White text color
                minimumSize: const Size(
                  double.infinity,
                  65,
                ), // Full width, fixed height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ), // Internal padding
              ),
              child: const Text('Create Event', style: TextStyle(fontSize: 20)),
            ),

            const SizedBox(height: 25), // Space between buttons
            // Manage Created Events Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement navigation or action for Manage Created Events
                print('Manage Created Events button pressed!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Manage Created Events',
                style: TextStyle(fontSize: 20),
              ),
            ),

            const Spacer(), // Pushes the back button to the bottom
          ],
        ),
      ),
      // Bottom navigation bar to house the back arrow
      bottomNavigationBar: Container(
        height: 100, // Height for the bottom bar area
        alignment: Alignment.center, // Center the content within this container
        child: GestureDetector(
          onTap: () {
            // TODO: Implement back action (e.g., Navigator.pop(context))
            print('Back button pressed!');
          },
          child: Container(
            width: 60, // Width for the circular background
            height: 60, // Height for the circular background
            decoration: const BoxDecoration(
              color: Colors.black, // Black circular background
              shape: BoxShape.circle, // Makes the container a circle
            ),
            child: const Icon(
              Icons.arrow_back_ios_new, // Modern back arrow icon
              color: Colors.white, // White arrow
              size: 30, // Size of the arrow icon
            ),
          ),
        ),
      ),
    );
  }
}
