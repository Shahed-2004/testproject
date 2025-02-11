// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pl/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  var Provider;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: viewModel.emailController,
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني",
                errorText:
                    viewModel.validateEmail(viewModel.emailController.text),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: viewModel.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                errorText: viewModel
                    .validatePassword(viewModel.passwordController.text),
              ),
            ),
            SizedBox(height: 24),
            viewModel.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => viewModel.login(context),
                    child: Text("تسجيل الدخول"),
                  ),
          ],
        ),
      ),
    );
  }
}
