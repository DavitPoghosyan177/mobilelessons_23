import 'package:flutter/material.dart';
import 'package:first/text_field_widget.dart';
import 'package:first/db/preferences_service.dart';
import 'package:first/button_signup.dart';


class SignUp extends StatefulWidget {
  const SignUp(this.preferencesService,{super.key});
  
  final PreferenceService preferencesService;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
          backgroundColor: Colors.white,
          
        ),
       body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/pnges/Illustration.signup.png', width: 138.0, height: 141.0),
                        ],
                    ),
                  ),

                  TextFieldWidget(
                     controller: _usernameController,
                    hintText: 'Enter username',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                    controller: _phoneNumberController,
                    hintText: 'Enter phone number',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                   controller: _emailController,
                    hintText: 'Enter email',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFieldWidget(
                     controller: _passwordController,
                    hintText: 'Enter password',
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),

                  ButtonWidget( 
                    text: "Login",
                    onTap: _signUp,          
                    ),
                  const SizedBox(height: 25),
                  const Text(
                    'or',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Already have an account? '),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/sign-in');
                          },
                          child: const Text('Sign In',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 111, 144),
                                  decoration: TextDecoration.underline,
                          )
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      );
  }
  Future<void> _signUp() async {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are required')));
      return;
    }

    try {
      await widget.preferencesService.setUsername(_usernameController.text);
      await widget.preferencesService.setPassword(_passwordController.text);
      await widget.preferencesService
          .setPhoneNumber(_phoneNumberController.text);
      await widget.preferencesService.setEmail(_emailController.text);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('/profile');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}