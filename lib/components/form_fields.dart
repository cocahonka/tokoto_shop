import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_suffix_icon.dart';

typedef SetState = void Function(VoidCallback);

class EmailFormField extends StatelessWidget {
  const EmailFormField(
      {Key? key,
      required this.errors,
      required this.onSaved,
      required this.setState})
      : super(key: key);

  final List<String> errors;
  final FormFieldSetter<String> onSaved;
  final SetState setState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => onSaved,
      onChanged: (value) {
        if (errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        if (errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if ((value?.isEmpty) ?? true) {
          if (!errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          }
          return '';
        }
        if (value != null && !emailValidatorRegExp.hasMatch(value)) {
          if (!errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField(
      {Key? key,
      required this.errors,
      required this.onSaved,
      required this.setState})
      : super(key: key);

  final List<String> errors;
  final FormFieldSetter<String> onSaved;
  final SetState setState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onSaved: onSaved,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        if (errors.contains(kPassNullError) ||
            (value.length >= kMinPasswordLength &&
                errors.contains(kShortPassError))) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if ((value?.isEmpty) ?? true) {
          if (!errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          }
          return '';
        }
        if (value != null && value.length < kMinPasswordLength) {
          if (!errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
          }
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
