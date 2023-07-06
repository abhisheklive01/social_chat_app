import 'package:flutter/material.dart';

import '../../../core/utility/validator.dart';
import '../../../services/auth_service.dart';
import 'login.dart';
// ignore_for_file: prefer_const_constructors

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var appValidator = AppValidator();
  var authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var isLoader = false;

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "userName": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
      };
      await authService.createUser(data, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF252634),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.0,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Create new Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                        controller: _userNameController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            _buildInputDecoration("Username", Icons.person),
                        validator: appValidator.validateUsername),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration("Email", Icons.email),
                        validator: appValidator.validateEmail),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration:
                          _buildInputDecoration("Phone number", Icons.call),
                      validator: appValidator.validatePhoneNumber,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: _buildInputDecoration("Password", Icons.lock),
                      validator: appValidator.validatePassword,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF15900)),
                            onPressed: _submitForm,
                            child: isLoader
                                ? Center(child: CircularProgressIndicator())
                                : Text("Create",
                                    style: TextStyle(fontSize: 20)))),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        "Login",
                        style:
                            TextStyle(color: Color(0xFFF15900), fontSize: 20),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0xAA494A59),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color(0xFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
