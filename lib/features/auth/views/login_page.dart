import 'package:flutter/material.dart';
import 'package:my_news/l10n/l10n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.login),
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
            FilledButton(onPressed: () {}, child: Text(context.l10n.login)),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text: context.l10n.newHere,
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: context.l10n.signUp,
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
