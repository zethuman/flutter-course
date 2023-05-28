import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routing_and_forms/pages/user_info_page.dart';

import '../model/user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  User newUser = User();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Register Page Demo"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "First Name",
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              validator: _validateName,
              onSaved: (value) => {newUser.name = value},
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(
                  RegExp(r'^[\d -]{1,15}$'),
                  allow: true,
                )
              ],
              validator: (value) => !_validatePhoneNumber(value)
                  ? 'Phone number must be in format #-###-###-####'
                  : null,
              decoration: const InputDecoration(
                  labelText: "Phone number",
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey))),
              onSaved: (value) => {newUser.phone = value},
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email address",
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              // validator: _validateEmail
              onSaved: (value) => {newUser.email = value},
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _passwordVisible,
              maxLength: 12,
              validator: _validatePassword,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: _passwordVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              onSaved: (value) => {newUser.password = value},
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: _passwordVisible,
              maxLength: 12,
              validator: _validatePassword,
              decoration: const InputDecoration(
                labelText: "Confirm password",
                prefixIcon: Icon(Icons.repeat_one),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey?.currentState?.validate() ?? false) {
      _formKey?.currentState?.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserInfoPage(
            user: newUser,
          ),
        ),
      );
      print("Name: ${_nameController.text}");
      print("Name: ${_phoneController.text}");
      print("Name: ${_emailController.text}");
      print("Name: ${_passwordController.text}");
      print("Name: ${_confirmPasswordController.text}");
    } else {
      _showMessage("Form is invalid! Please review and fix");
    }
  }

  void _showMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? _validateName(String? value) {
    final validName = RegExp(r'^[A-Za-z]+$');
    if (value?.isEmpty ?? false) {
      return "First Name is required";
    } else if (!validName.hasMatch(value ?? "")) {
      return "Please enter only alpha characters";
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String? value) {
    if (value == null) {
      return false;
    } else {
      final phoneExp = RegExp(r'^\d-\d\d\d\-\d\d\d-\d\d\d\d$');
      return phoneExp.hasMatch(value);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null) {
      return "Email can not be empty";
    } else if (!_emailController.text.contains('@')) {
      return "Email is invalid";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value == null) {
      return "Password can not be empty";
    } else if (value.length > 12) {
      return "Password length too large";
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return "Passwords dos not match";
    } else {
      return null;
    }
  }
}
