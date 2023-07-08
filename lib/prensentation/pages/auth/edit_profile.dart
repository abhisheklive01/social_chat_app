import 'package:flutter/material.dart';

import '../../../core/utility/validator.dart';
import '../../../services/auth_service.dart';
import 'login.dart';
// ignore_for_file: prefer_const_constructors

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.profileData});
  final Map<String, dynamic> profileData;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var appValidator = AppValidator();
  var authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  final _desController = TextEditingController();
  final _profileUrlController = TextEditingController();

  var isLoader = false;

  @override
  void initState() {
    print(widget.profileData);
    print("sss ${widget.profileData}");

    setState(() {
      _userNameController.text = widget.profileData["userName"];
      _emailController.text = widget.profileData["email"];
    });
    print("Test ${widget.profileData}");

    print(widget.profileData["userName"]);
    super.initState();
  }

  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "userName": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "bio": _bioController.text,
        "des": _desController.text,
        "profileUrl": _profileUrlController.text,
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
        appBar: AppBar(
          title: Text("Update Account"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Color(0xCAF15800),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 5,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Icon(Icons.add_circle_outline)),
                        )
                      ],
                    ),
                  
                    SizedBox(
                      height: 10.0,
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
                      controller: _userNameController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration("Bio", Icons.file_copy),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _userNameController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration(
                          "Description", Icons.description),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _userNameController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration("Url", Icons.link),
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
                                : Text("Update",
                                    style: TextStyle(fontSize: 20)))),
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
