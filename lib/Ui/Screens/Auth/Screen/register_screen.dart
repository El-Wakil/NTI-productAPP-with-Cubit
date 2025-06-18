import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_app/Ui/Screens/home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tokenController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _nationalIdController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.trim().length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    return null;
  }

  String? _validateNationalId(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرقم القومي مطلوب';
    }
    if (value.length != 14 || !RegExp(r'^\d{14}$').hasMatch(value)) {
      return 'الرقم القومي يجب أن يكون 14 رقم';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    if (value.length != 11 || !RegExp(r'^\d{11}$').hasMatch(value)) {
      return 'رقم الهاتف يجب أن يكون 11 رقم';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    return null;
  }

  String? _validateToken(String? value) {
    if (value == null || value.isEmpty) {
      return 'التوكن مطلوب';
    }
    if (value.length < 5) {
      return 'التوكن يجب أن يكون 5 أحرف على الأقل';
    }
    return null;
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate registration process
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم التسجيل بنجاح!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),

                // Header
                Text(
                  'إنشاء حساب جديد',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'أدخل بياناتك لإنشاء حساب جديد',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // Name Field
                _buildTextField(
                  controller: _nameController,
                  label: 'الاسم',
                  icon: Icons.person_outline,
                  validator: _validateName,
                ),

                const SizedBox(height: 20),

                // National ID Field
                _buildTextField(
                  controller: _nationalIdController,
                  label: 'الرقم القومي',
                  icon: Icons.badge_outlined,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(14),
                  ],
                  validator: _validateNationalId,
                ),

                const SizedBox(height: 20),

                // Phone Field
                _buildTextField(
                  controller: _phoneController,
                  label: 'رقم الهاتف',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  validator: _validatePhone,
                ),

                const SizedBox(height: 20),

                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: 'البريد الإلكتروني',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),

                const SizedBox(height: 20),

                // Password Field
                _buildTextField(
                  controller: _passwordController,
                  label: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: _validatePassword,
                ),

                const SizedBox(height: 20),

                // Token Field
                _buildTextField(
                  controller: _tokenController,
                  label: 'التوكن',
                  icon: Icons.security_outlined,
                  validator: _validateToken,
                ),

                const SizedBox(height: 32),

                // Register Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لديك حساب بالفعل؟ ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: isPassword && !_isPasswordVisible,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue[600]),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() => _isPasswordVisible = !_isPasswordVisible);
                },
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[600],
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue[600]!, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
