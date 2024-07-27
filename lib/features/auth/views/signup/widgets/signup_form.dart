import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/core/config/theme/ui_constants.dart';
import 'package:my_news/l10n/l10n.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required ValueNotifier<bool> showPassword,
    required TextEditingController passwordController,
    super.key,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _showPassword = showPassword,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final ValueNotifier<bool> _showPassword;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const Icon(FluentIcons.person_24_regular),
              hintText: context.l10n.name,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.nameIsRequired;
              }
              return null;
            },
          ),
          gapH12,
          TextFormField(
            controller: _emailController,
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
            valueListenable: _showPassword,
            builder: (_, showPassword, __) {
              return TextFormField(
                controller: _passwordController,
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
                    onPressed: () => _showPassword.value = !showPassword,
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
