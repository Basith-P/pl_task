import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/core/config/theme/ui_constants.dart';
import 'package:my_news/l10n/l10n.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.showPasswordNotifier,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<bool> showPasswordNotifier;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: emailController,
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const Icon(FluentIcons.mail_24_regular),
              hintText: context.l10n.email,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.emailIsRequired;
              }
              const emailRegx = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
              if (!RegExp(emailRegx).hasMatch(value)) {
                return context.l10n.invalidEmail;
              }
              return null;
            },
          ),
          gapH12,
          ValueListenableBuilder(
            valueListenable: showPasswordNotifier,
            builder: (_, showPassword, __) {
              return TextFormField(
                controller: passwordController,
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
                    onPressed: () => showPasswordNotifier.value = !showPassword,
                  ),
                  counter: const Offstage(),
                ),
                maxLength: 12,
                obscureText: !showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.passwordIsRequired;
                  }
                  if (value.length < 6) {
                    return context.l10n.passwordLength;
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
