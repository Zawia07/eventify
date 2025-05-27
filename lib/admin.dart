import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Optional: Define a default font if you want to match the image's serif look
        // You might need to import a custom font for exact match.
        // For demonstration, I'll use a basic style.
        fontFamily:
            'Roboto', // Or 'Georgia' or 'Merriweather' for serif look if available
      ),
      home: const AdminManageUsersScreen(),
    );
  }
}

class AdminManageUsersScreen extends StatefulWidget {
  const AdminManageUsersScreen({super.key});

  @override
  State<AdminManageUsersScreen> createState() => _AdminManageUsersScreenState();
}

class _AdminManageUsersScreenState extends State<AdminManageUsersScreen> {
  // State variable to keep track of the selected user
  String? _selectedUser =
      'User3'; // Initialize with User3 selected as per image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow for the app bar
        title: const Text(
          'Admin: Manage Users',
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
            // User List
            _buildUserListItem('User 1'),
            const SizedBox(height: 12),
            _buildUserListItem(
              'User2',
            ), // Note: Image has "User2" without space
            const SizedBox(height: 12),
            _buildUserListItem('User3'),

            const Spacer(), // Pushes content towards the top and bottom
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Delete User
                      if (_selectedUser != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Delete $_selectedUser!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a user to delete.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor: Colors.white, // Text color
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded corners
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Delet User',
                    ), // Replicating the typo from the image
                  ),
                ),
                const SizedBox(width: 20), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Edit User
                      if (_selectedUser != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Edit $_selectedUser!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a user to edit.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor: Colors.white, // Text color
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded corners
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Edit User'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40), // Space above back button
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

  Widget _buildUserListItem(String userName) {
    bool isSelected = _selectedUser == userName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUser = userName;
        });
      },
      child: Container(
        height: 60, // Fixed height for user items
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.amber.shade400
              : Colors
                    .grey
                    .shade200, // Yellow if selected, light grey otherwise
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        alignment: Alignment.center, // Center the text
        child: Text(
          userName,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black, // White text for selected, black for unselected
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
