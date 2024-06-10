import 'dart:html';

import 'package:flutter/material.dart';
import '../widgets/adaptive_scaffold.dart';

void main() {
  runApp(const Register());
}

class Register extends StatefulWidget {
  const Register({super.key});

  static const welcomeImage = '../assets/Logo4.jpg';

  @override
  State<Register> createState() => _RegisterState();
}

final Color darkBlue = Color.fromARGB(255, 114, 106, 30);

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AIRWAY ACADEMIA",
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: Center(
        child: AdaptiveScaffold(
          compact: CompactView(
              welcomeImage: Register.welcomeImage, formKey: _formKey),
          full:
              FullView(welcomeImage: Register.welcomeImage, formKey: _formKey),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool _obscureText = true;
  bool _activateBool = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome to Airway Academia!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Register if you don't have an account",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Form(
            key: widget._formKey,
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    //dependencies: email_validator: '^2.1.16'
                    border: OutlineInputBorder(),
                    labelText: 'Name *',
                    // ignore: unnecessary_const
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      // child: Icon(Icons.email),
                    )),
                controller: nameController,
              ),
              const SizedBox(height: 9),
              TextFormField(
                decoration: const InputDecoration(
                    //dependencies: email_validator: '^2.1.16'
                    border: OutlineInputBorder(),
                    labelText: 'Email *',
                    // ignore: unnecessary_const
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      // child: Icon(Icons.email),
                    )),
                controller: emailController,
              ),
              const SizedBox(height: 9),
              TextFormField(
                obscureText: _obscureText,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password *',
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      // child: Icon(Icons.lock),
                    )),
              ),
              const SizedBox(height: 9),
              TextFormField(
                obscureText: _obscureText,
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repeat your password *',
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      // child: Icon(Icons.lock),
                    )),
              )
            ]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              String formEmail = emailController.text.toString();
              String formPassword = passwordController.text.toString();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(1024, 60),
            ),
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const Register()));
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size(1024, 50),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future openDialog(String text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                //idea
              },
            ),
          ],
        ),
      );
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    required this.welcomeImage,
  }) : super(key: key);

  final String welcomeImage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(welcomeImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: Text(
            "",
            maxLines: 2,
            style: textTheme.headlineMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: Row(
            children: [
              const Icon(
                Icons.local_airport_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 8),
              Text(
                "AIRWAY ACADEMIA",
                maxLines: 2,
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CompactView extends StatelessWidget {
  const CompactView({
    Key? key,
    required this.welcomeImage,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String welcomeImage;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: HeroImage(welcomeImage: welcomeImage),
          ),
          RegisterForm(formKey: _formKey),
        ],
      );
    });
  }
}

class FullView extends StatelessWidget {
  const FullView({
    Key? key,
    required this.welcomeImage,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String welcomeImage;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Flexible(child: RegisterForm(formKey: _formKey)),
          Flexible(
            child: HeroImage(welcomeImage: welcomeImage),
          ),
        ],
      );
    });
  }
}
