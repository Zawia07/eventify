import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Screen',
      theme: ThemeData(
        // Optionally, you can define a default font family that resembles Georgia or a serif font
        // fontFamily: 'Georgia', // You would need to add this font to your pubspec.yaml
        useMaterial3: true,
      ),
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Jie Ranjan',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'hello@reallygreatsite.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '*****',
  );
  final TextEditingController _dobController = TextEditingController(
    text: 'Sign up',
  ); // Placeholder text

  Future<void> _selectDate(BuildContext context) async {
    // This is a placeholder for a real date picker.
    // In a real app, you'd showDatePicker here and update _dobController.text
    print('Date picker would be shown here!');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        // Format the date as needed, e.g., '2023-10-26'
        _dobController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _confirmRegistration() {
    // Implement your registration logic here
    print('Registration Confirmed!');
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print(
      'Password (mock): ${_passwordController.text}',
    ); // In real app, don't log password directly
    print('Date of Birth: ${_dobController.text}');
    // Show a SnackBar or navigate
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration attempt submitted!')),
    );
  }

  // Common styling for input fields
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      filled: true,
      fillColor: Colors.grey[200], // Light grey background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        borderSide: BorderSide.none, // No border line
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 16.0,
      ),
    );
  }

  // Common styling for labels
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft, // Align left for labels
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600, // Semi-bold
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch children horizontally
            children: <Widget>[
              // Status bar placeholder (optional, but good for visual alignment)
              const SizedBox(height: 50),

              // Registration Screen Title
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Registration\nScreen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight
                        .w900, // Very bold to approximate Georgia font
                    color: Colors.black,
                    // If you have a custom font like Georgia, you would specify it here:
                    // fontFamily: 'Georgia',
                  ),
                ),
              ),
              const SizedBox(height: 50), // Space after title
              // NAME field
              _buildLabel('NAME'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration('Jie Ranjan'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20), // Space between fields
              // EMAIL field
              _buildLabel('EMAIL'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration('hello@reallygreatsite.com'),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // PASSWORD field
              _buildLabel('PASSWORD'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                decoration: _inputDecoration('*****'),
                obscureText: true, // Hide password text
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // DATE OF BIRTH field
              _buildLabel('DATE OF BIRTH'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  // Prevents TextFormField from directly getting focus
                  child: TextFormField(
                    controller: _dobController,
                    decoration: _inputDecoration('Sign up'),
                    readOnly: true, // Make it read-only
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 40), // More space before the button
              // Confirm Registration Button
              ElevatedButton(
                onPressed: _confirmRegistration,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  foregroundColor: Colors.white, // White text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ), // Full width, fixed height
                ),
                child: const Text(
                  'Confirm Registration',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30), // Space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }
}
