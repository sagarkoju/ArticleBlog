import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vlogpost/Bloc/bloc/sign_in_bloc.dart';
import 'package:vlogpost/screen/custom_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool togglevisibilty = false;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  enabled: true,
                  onChanged: (value) {
                    context.read<SignInBloc>().add(SignInTextChangedEvent(
                        emailChanged: emailcontroller.text,
                        passwordChanged: passwordcontroller.text));
                  },
                  validator: (value) {
                    final regex = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                    if (value == null || value == '') {
                      return 'Email is required';
                    } else if (!regex.hasMatch(value.trim())) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      focusColor: Colors.green,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.green)),
                      hintText: " Enter the Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: togglevisibilty,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    context.read<SignInBloc>().add(SignInTextChangedEvent(
                        emailChanged: emailcontroller.text,
                        passwordChanged: passwordcontroller.text));
                  },
                  validator: (password) {
                    if (password == null || password == '') {
                      return 'password is required';
                    } else if (password.length < 5) {
                      return 'Enter the min 5 password';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    focusColor: Colors.green,
                    labelText: "Enter the Password",
                    hintText: " Enter the password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          togglevisibilty = !togglevisibilty;
                        });
                      },
                      icon: togglevisibilty
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(state.message,
                          style: const TextStyle(color: Colors.red));
                    }
                    return Container();
                  },
                ),
              ),
              buildbutton(),
            ]),
      ),
    );
  }

  buildbutton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInValidState) {
            Future.delayed(const Duration(seconds: 5), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CustomePainterScreen(
                            progress: 0.5,
                          )));
            });
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignInLoadingState) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      (state is SignInValidState) ? Colors.grey : Colors.blue,
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(72),
                ),
                onPressed: () {
                  if (state is SignInValidState) {
                    context.read<SignInBloc>().add(SignInSubmittedEvent(
                        email: emailcontroller.text,
                        password: passwordcontroller.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Successful'),
                      ),
                    );
                  }

                  // if (formkey.currentState!.validate()) {

                  // }
                },
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    return const Text('Login');
                  },
                ),
              );
            }
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:
                    (state is SignInValidState) ? Colors.blue : Colors.grey,
                shape: const StadiumBorder(),
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size.fromHeight(72),
              ),
              onPressed: () {
                if (state is SignInValidState) {
                  context.read<SignInBloc>().add(SignInSubmittedEvent(
                      email: emailcontroller.text,
                      password: passwordcontroller.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login Successful'),
                    ),
                  );
                }

                // if (formkey.currentState!.validate()) {

                // }
              },
              child: const Text('Login'),
            );
          },
        ),
      ),
    );
  }
}
