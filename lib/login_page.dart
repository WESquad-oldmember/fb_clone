import 'package:exercice_fb_clone/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage("assets/images/fake_logo.png"),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Clonebook",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 45),
              const Text(
                "Welcome to Clonebook, please enter your credentials below to login",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  IconData _passwordIcon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please fill in your email";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    _passwordVisible = true;
                    _passwordIcon = Icons.visibility_off;
                  });
                },
                onTapUp: (TapUpDetails details) {
                  setState(() {
                    _passwordVisible = false;
                    _passwordIcon = Icons.visibility;
                  });
                },
                child: Icon(_passwordIcon),
                // onPressed: setPasswordIcon,
              ),
            ),
            obscureText: !_passwordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              if (value.length < 8) {
                return "Your password must be at least 8 charaters";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('🎉 Login successful!', textAlign: TextAlign.center),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }
            },
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
