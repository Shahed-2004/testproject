import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateEmail(String email) {
    if (email.isEmpty) return "البريد الإلكتروني مطلوب";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      return "أدخل بريدًا إلكترونيًا صحيحًا";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "كلمة المرور مطلوبة";
    if (password.length < 6) return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
    return null;
  }

  Future<void> login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (validateEmail(email) != null || validatePassword(password) != null) {
      return;
    }

    _isLoading = true;
    notifyListeners(); // تحديث الـ UI

    await Future.delayed(Duration(seconds: 2)); // محاكاة استدعاء API

    _isLoading = false;
    notifyListeners(); // تحديث الـ UI بعد الانتهاء

    // تحقق من البيانات (مثال فقط)
    if (email == "test@example.com" && password == "123456") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنجاح!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("البريد الإلكتروني أو كلمة المرور غير صحيحة")));
    }
  }
}
