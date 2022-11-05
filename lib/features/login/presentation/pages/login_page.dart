import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/widget_helpers.dart';
import '../../../../injection_container.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => getIt<LoginCubit>(),
        child: _loginForm(),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _loginForm() {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              inProgress: () {
                _showSnackBar(context, AppLocalizations.of(context)!.login_in_progress);
              },
              success: (token) {
                context.goNamed('categories');
              },
              failure: () {
                _showSnackBar(context, AppLocalizations.of(context)!.login_failed);
              });
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title(),
                addVerticalSpace(48),
                _usernameField(),
                addVerticalSpace(8),
                _passwordField(),
                addVerticalSpace(16),
                _loginButton(),
              ],
            ),
          ),
        ));
  }

  Widget _title() {
    return Text(
      AppLocalizations.of(context)!.login_title,
      style: const TextStyle(fontSize: 24),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _usernameController,
      autofocus: true,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: AppLocalizations.of(context)!.login_username_hint,
        labelText: AppLocalizations.of(context)!.login_username,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.login_username_validation;
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordController,
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        icon: const Icon(Icons.security),
        hintText: AppLocalizations.of(context)!.login_password_hint,
        labelText: AppLocalizations.of(context)!.login_password,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.login_password_validation;
        }
        return null;
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final username = _usernameController.text;
            final password = _passwordController.text;
            context.read<LoginCubit>().login(username: username, password: password);
          }
        },
        child: Text(AppLocalizations.of(context)!.login_button_title),
      );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
