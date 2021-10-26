import 'package:flutter/material.dart';
import 'package:tokoto_shop/components/form_fields.dart';
import 'package:tokoto_shop/constants.dart';
import 'package:tokoto_shop/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Register Account',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _conform_password;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        EmailFormField(errors: errors, onSaved: (value) {}, setState: setState),
        SizedBox(height: getProportionateScreenHeight(30)),
        PasswordFormField(
            errors: errors, onSaved: (value) {}, setState: setState),
        SizedBox(height: getProportionateScreenHeight(30)),
        PasswordFormField(
            errors: errors, onSaved: (value) {}, setState: setState),
        SizedBox(height: getProportionateScreenHeight(30)),
      ],
    ));
  }
}
