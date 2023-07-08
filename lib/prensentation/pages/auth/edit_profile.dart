import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:social_chat_app/services/firestore_service.dart';

import '../../../core/utility/validator.dart';
import '../../../services/auth_service.dart';
import '../upload_post/widgets/media_picker.dart';
import 'login.dart';
// ignore_for_file: prefer_const_constructors

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.userDetails});
  final Map<String, dynamic> userDetails;

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
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _desController = TextEditingController();
  final _urlController = TextEditingController();
  final firestoreService = FirestoreService();

  var isLoader = false;
  var isLoaderProfile = false;
  var profileUrl;

  @override
  void initState() {
    setState(() {
      _userNameController.text = widget.userDetails['userName'];
      _emailController.text = widget.userDetails['email'];
      _phoneController.text = widget.userDetails['phone'];
      _bioController.text = widget.userDetails['bio'];
      _desController.text = widget.userDetails['des'];
      _urlController.text = widget.userDetails['url'];
      profileUrl = widget.userDetails['profileUrl'];
    });
    super.initState();
  }

  var mediaPicker = MediaPicker();

  imageUpload() async {
    var imagefile = await mediaPicker.imgPicker();
    if (imagefile != null) {
      uploadFile(File(imagefile));
    }
  }

  uploadFile(File selectedFile) async {
    setState(() {
      isLoaderProfile = true;
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);
    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      setState(() {
        profileUrl = downloadUrl;
      });
      setState(() {
        isLoaderProfile = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoaderProfile = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("uploadTask Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }



  Future<void> _submitForm() async {
    setState(() {
      isLoader = true;
    });
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "id": widget.userDetails['id'],
        "userName": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "bio": _bioController.text,
        "des": _desController.text,
        "profileUrl": profileUrl,
        "url": _urlController.text,
      };

      await firestoreService.updateUser(data, context);
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
                            child: isLoaderProfile
                                ? Center(child: CircularProgressIndicator())
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(profileUrl),
                                  ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  imageUpload();
                                },
                                icon: Icon(Icons.edit))),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
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
                      controller: _bioController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
                      decoration:
                          _buildInputDecoration("Bio", Icons.copy_all_sharp),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _desController,
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
                      controller: _urlController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: _buildInputDecoration("url", Icons.link),
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
                    SizedBox(
                      height: 30.0,
                    ),
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
