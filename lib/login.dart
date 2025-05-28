import 'package:flutter/material.dart';

// --- 1. Constants ---

// Colors
const Color kPrimaryBlack = Colors.black;
const Color kPrimaryWhite = Colors.white;
const Color kLightGrey = Color(0xFFEEEEEE); // Light grey for input fields

// Text Styles (using default system fonts)
final TextStyle kTitleTextStyle = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: kPrimaryBlack,
);

final TextStyle kLabelTextStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: kPrimaryBlack,
);

final TextStyle kInputHintTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.grey[600],
);

final TextStyle kInputTextStyle = const TextStyle(
  fontSize: 16,
  color: kPrimaryBlack,
);

final TextStyle kButtonTextStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kPrimaryWhite,
);

// Common Widget Padding
const EdgeInsets kHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0);
const EdgeInsets kVerticalSpacing = EdgeInsets.symmetric(vertical: 10.0);

// --- 2. Custom TextField Widget ---

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  // Changed to super.key
  const CustomTextField({
    super.key, // Use super.key
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
          child: Text(label.toUpperCase(), style: kLabelTextStyle),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: kLightGrey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: kInputTextStyle,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: kInputHintTextStyle,
              border: InputBorder.none, // Removes the default underline
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}

// --- 3. Login Screen ---

class LoginScreen extends StatefulWidget {
  // Changed to super.key
  const LoginScreen({super.key}); // Use super.key

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Replaced print() with debugPrint()
    debugPrint('Attempting to log in:');
    debugPrint('Email: ${_emailController.text}');
    debugPrint('Password: ${_passwordController.text}');

    // For demonstration, navigate to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kHorizontalPadding.copyWith(
            top: 80.0,
          ), // Top padding for aesthetic
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login Screen',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              CustomTextField(
                label: 'Email',
                hintText: 'hello@reallygreatsite.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                label: 'Password',
                hintText: '*****',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryBlack,
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Log In', style: kButtonTextStyle),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  foregroundColor: kPrimaryBlack, // Text color
                ),
                child: Text(
                  'Don\'t have an account? Register Now',
                  style: kInputHintTextStyle.copyWith(color: kPrimaryBlack),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 4. Registration Screen ---

class RegistrationScreen extends StatefulWidget {
  // Changed to super.key
  const RegistrationScreen({super.key}); // Use super.key

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  void _confirmRegistration() {
    // Replaced print() with debugPrint()
    debugPrint('Attempting to register:');
    debugPrint('Name: ${_nameController.text}');
    debugPrint('Email: ${_emailController.text}');
    debugPrint('Password: ${_passwordController.text}');
    debugPrint('DOB: ${_dobController.text}');

    // After successful registration, navigate to HomeScreen
    // Using pushReplacement to prevent going back to registration via back button
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  // A simple date picker for Date of Birth
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kPrimaryBlack, // Header background color
              onPrimary: kPrimaryWhite, // Header text color
              onSurface: kPrimaryBlack, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: kPrimaryBlack, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kHorizontalPadding.copyWith(top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Registration\nScreen',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              CustomTextField(
                label: 'Name',
                hintText: 'Jie Ranjen',
                controller: _nameController,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                label: 'Email',
                hintText: 'hello@reallygreatsite.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                label: 'Password',
                hintText: '*****',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              Column(
                // Wrap DOB in Column to apply label
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
                    child: Text(
                      'Date of Birth'.toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: AbsorbPointer(
                        // Prevents keyboard from showing when tapping
                        child: TextField(
                          controller: _dobController,
                          style: kInputTextStyle,
                          decoration: InputDecoration(
                            hintText:
                                'YYYY-MM-DD', // Changed from 'Sign up' for clarity
                            hintStyle: kInputHintTextStyle,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: _confirmRegistration,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryBlack,
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Confirm Registration', style: kButtonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 5. Home Screen ---

class HomeScreen extends StatelessWidget {
  // Changed to super.key
  const HomeScreen({super.key}); // Use super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!', style: kTitleTextStyle.copyWith(fontSize: 24)),
        backgroundColor: kPrimaryWhite,
        foregroundColor: kPrimaryBlack,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Simulate logout by navigating back to LoginScreen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false, // Remove all routes from stack
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are logged in!',
              style: kLabelTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'This is your main app content.',
              style: kInputHintTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// --- 6. Main App Entry Point ---

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Changed to super.key
  const MyApp({super.key}); // Use super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryWhite,
          foregroundColor: kPrimaryBlack,
          elevation: 0,
        ),
      ),
      home: const LoginScreen(), // Start with the Login Screen
    );
  }
}
