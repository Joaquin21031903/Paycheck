import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordFieldFocused = false;
  bool _hasUppercase = false;
  bool _hasDigits = false;
  bool _hasSpecialCharacters = false;
  bool _hasMinLength = false;

  void _checkPassword(String password) {
    setState(() {
      _isPasswordFieldFocused = true;
      _hasUppercase = password.contains(RegExp(r'[A-Z]'));
      _hasDigits = password.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacters =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      _hasMinLength = password.length >= 8;
    });
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  Widget _buildPasswordCriteria(String criteria, bool met) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.cancel,
          color: met ? Colors.green : Colors.red,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(criteria),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 5, 35, 66), // Navy blue background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('LOGO2.jpg'), // Path to your mini logo
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Next Generation Payroll for A New Era.',
                    style: TextStyle(
                      color: Color.fromRGBO(
                          245, 188, 113, 1), // Updated to match modern color
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80), // Space from the top logo section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('LOGO2.jpg'), // Path to your main logo
                ),
                const SizedBox(height: 20),
                const Text(
                  'PAYCHECK',
                  style: TextStyle(
                    color: Color.fromRGBO(
                        245, 188, 113, 1), // Updated to match modern color
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30), // More space for aesthetic balance
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(
                        245, 188, 113, 0.756), // Updated to match modern color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Email Address',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: _checkPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            if (!_hasMinLength) {
                              return 'Password must be at least 8 characters long!';
                            }
                            if (!_hasUppercase) {
                              return 'Password must contain at least one uppercase letter!';
                            }
                            if (!_hasDigits) {
                              return 'Password must contain at least one number!';
                            }
                            if (!_hasSpecialCharacters) {
                              return 'Password must contain at least one special character!';
                            }
                            return null;
                          },
                        ),
                        if (_isPasswordFieldFocused)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              children: [
                                _buildPasswordCriteria(
                                    "Contains at least 8 characters",
                                    _hasMinLength),
                                _buildPasswordCriteria(
                                    "Contains uppercase letter", _hasUppercase),
                                _buildPasswordCriteria(
                                    "Contains number", _hasDigits),
                                _buildPasswordCriteria(
                                    "Contains special character",
                                    _hasSpecialCharacters),
                              ],
                            ),
                          ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFCD8A32), // Updated to match modern color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Handle sign-up button press
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color:
                            Color(0xFFCD8A32)), // Updated to match modern color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPasswordCriteria(String criteria, bool met) {
  return Row(
    children: [
      Icon(
        met ? Icons.check : Icons.close,
        color: met ? Colors.green : Colors.red,
      ),
      const SizedBox(width: 8),
      Text(criteria),
    ],
  );
}
