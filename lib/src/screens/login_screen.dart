import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/models/forms.dart';
import 'package:flutter_meetuper/src/screens/meetup_home_screen.dart';
import 'package:flutter_meetuper/src/screens/register_screen.dart';
import 'package:flutter_meetuper/src/utils/validators.dart';

class LoginScreen extends StatefulWidget {
  static final String route = '/login';

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordKey = GlobalKey<FormFieldState<String>>();
  final _emailKey = GlobalKey<FormFieldState<String>>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginFormData _loginFormData = LoginFormData();

  AutovalidateMode _validateMode = AutovalidateMode.disabled;

  @override
  initState() {
    super.initState();
    //_emailController.addListener(() => print(_emailController.text));
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print(
          'Data from form: email: ${_loginFormData.email}; password: ${_loginFormData.password}');
    } else {
      setState(() => _validateMode = AutovalidateMode.always);
    }
  }

  _buildLinks() => Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          child: Text('Not registered yet ? Register now',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          onTap: () => Navigator.pushNamed(context, RegisterScreen.route),
        ),
        GestureDetector(
          child: Text('Continue to home page',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          onTap: () => Navigator.pushNamed(context, MeetupHomeScreen.route),
        )
      ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is login screen'),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            autovalidateMode: _validateMode,
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    'Login And Explore',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.headline5,
                  onSaved: (value) => _loginFormData.email = value,
                  decoration: InputDecoration(hintText: 'Email Address'),
                  key: _emailKey,
                  // ignore: missing_return
                  validator: composeValidators('email',
                      [requiredValidator, minLengthValidator, emailValidator]),
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.headline5,
                  onSaved: (value) => _loginFormData.password = value,
                  decoration: InputDecoration(hintText: 'Password'),
                  key: _passwordKey,
                  // ignore: missing_return
                  validator: composeValidators(
                      'password', [requiredValidator, minLengthValidator]),
                ),
                _buildLinks(),
                Container(
                    alignment: Alignment(-1.0, 0.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      child: const Text('Submit'),
                      onPressed: _submit,
                    ))
              ],
            ),
          )),
    );
  }
}
