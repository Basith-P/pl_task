import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/common/views/widgets/loader.dart';
import 'package:my_news/features/auth/auth_controller.dart';
import 'package:my_news/features/auth/views/login/login_page.dart';
import 'package:my_news/features/auth/views/signup/widgets/signup_form.dart';
import 'package:my_news/l10n/l10n.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const routeName = 'signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late ValueNotifier<bool> _showPassword;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _showPassword = ValueNotifier(false);
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthController>().signUp(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final isLoading = context.watch<AuthController>().isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appNameInAppBar,
          style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SignupForm(
                  formKey: _formKey,
                  nameController: _nameController,
                  emailController: _emailController,
                  showPassword: _showPassword,
                  passwordController: _passwordController,
                ),
              ),
            ),
            FilledButton(
              onPressed: isLoading ? () {} : submitForm,
              child: isLoading ? const Loader() : Text(context.l10n.signUp),
            ),
            gapH12,
            RichText(
              text: TextSpan(
                text: context.l10n.alreadyHaveAnAccount,
                style: textTheme.bodyLarge,
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.goNamed(LoginPage.routeName),
                    text: context.l10n.login,
                    style: textTheme.titleMedium!
                        .copyWith(color: colorScheme.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _showPassword.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
