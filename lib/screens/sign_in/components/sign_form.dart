import 'package:flutter/material.dart';
import 'package:tokoto_shop/components/default_button.dart';
import 'package:tokoto_shop/components/form_error.dart';
import 'package:tokoto_shop/components/form_fields.dart';
import 'package:tokoto_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:tokoto_shop/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  // ignore: unused_field
  String? _email;
  // ignore: unused_field
  String? _password;
  bool _remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailFormField(
            errors: errors,
            onSaved: (value) {
              _email = value;
            },
            setState: setState,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          PasswordFormField(
              errors: errors,
              onSaved: (value) {
                _password = value;
              },
              setState: setState),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: _remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    _remember = value ?? false;
                  });
                },
              ),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
