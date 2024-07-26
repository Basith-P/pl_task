import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_news/core/config/theme/ui_constants.dart';
import 'package:my_news/l10n/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late ValueNotifier<bool> _showPassword;

  @override
  void initState() {
    super.initState();
    _showPassword = ValueNotifier(false);
  }

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
                        decoration: kTextFieldDecoration.copyWith(
                          prefixIcon: const Icon(FluentIcons.mail_24_regular),
                          hintText: context.l10n.email,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: _showPassword,
                        builder: (_, showPassword, __) {
                          return TextFormField(
                            decoration: kTextFieldDecoration.copyWith(
                              prefixIcon: const Icon(
                                FluentIcons.lock_closed_24_regular,
                              ),
                              hintText: context.l10n.password,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  showPassword
                                      ? FluentIcons.eye_off_24_regular
                                      : FluentIcons.eye_24_regular,
                                ),
                                onPressed: () =>
                                    _showPassword.value = !showPassword,
                              ),
                            ),
                            obscureText: !showPassword,
                          );
                        },
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
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _showPassword.dispose();
    super.dispose();
  }
}
