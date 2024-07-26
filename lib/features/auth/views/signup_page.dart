import 'package:flutter/material.dart';
import 'package:my_news/l10n/l10n.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appNameInAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: context.l10n.name),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: context.l10n.email),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: context.l10n.password),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FilledButton(onPressed: () {}, child: Text(context.l10n.signUp)),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text: context.l10n.alreadyHaveAnAccount,
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: context.l10n.login,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
