import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unifesta/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCollege;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> colleges = [
    'DR MGR EDUCATIONAL AND RESEARCH INSTITUTE',
    'ANNA UNIVERSITY',
    'INDIAN INSTITUTE OF TECHNOLOGY MADRAS',
    'Vellore Institute of Technology (VIT)',
    'LOYOLA COLLEGE',
    'SSN COLLEGE OF ENGINEERING',
    'Madras Institute of Technology (MIT)',
    'MADRAS CHRISTIAN COLLEGE',
    'Sri Ramachandra Institute of Higher Education',
    'Kilpauk Medical College (KMC)',
    'UNIVERSITY OF MADRAS',
  ];

  final _secureStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3639),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Signup',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                buildLabel('Name'),
                buildTextField(controller: _nameController, hint: 'Enter your name...'),
                SizedBox(height: 20),
                buildLabel('Select your College / University'),
                buildCollegeDropdown(),
                SizedBox(height: 20),
                buildLabel('Email'),
                buildTextField(controller: _emailController, hint: 'Enter your email...'),
                SizedBox(height: 20),
                buildLabel('Password'),
                buildTextField(controller: _passwordController, hint: 'Enter your password...', obscureText: true),
                SizedBox(height: 20),
                buildLabel('Confirm Password'),
                buildTextField(hint: 'Enter your confirm password...', obscureText: true),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && selectedCollege != null) {
                        
                        final prefs = await SharedPreferences.getInstance();
                        final normalizedEmail = _emailController.text.trim().toLowerCase(); 

                        await prefs.setString('user_email', normalizedEmail); 
                        await prefs.setString('user_name', _nameController.text.trim());
                        await prefs.setString('user_college', selectedCollege!);
                        await _secureStorage.write(key: 'user_password', value: _passwordController.text.trim());

                        
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA5C9CA),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'If you have an account? Login',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget buildTextField({
    String hint = '',
    bool obscureText = false,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
    );
  }

  Widget buildCollegeDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration.collapsed(hintText: ''),
        value: selectedCollege,
        hint: Text(
          'Select your college/university...',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black54,
          ),
        ),
        iconEnabledColor: Color(0xFFA5C9CA),
        dropdownColor: Colors.white,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedCollege = newValue;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your college';
          }
          return null;
        },
        items: colleges.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}










