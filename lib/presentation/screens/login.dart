import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iattened/application/auth/firebase_api/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.input.dart';
import 'package:iattened/application/auth/firebase_api/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.use_case.dart';
import 'package:iattened/domain/models/doctormodel.dart';
import 'package:iattened/presentation/widgets/textfield.dart';

import '../../application/auth/firebase_api/use_cases/sign_in_with_email_and_password/sign_in_with_email_and_password.input.dart';
import '../../application/auth/firebase_api/use_cases/sign_in_with_email_and_password/sign_in_with_email_and_password.use_case.dart';
import '../../router/app_router.gr.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final emailcontroller = useTextEditingController();
    final passwordController = useTextEditingController();
    final user = useState(const DoctorModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4578),
        title: const Text(
          'I Attend',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey.value,
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                    height: 140,
                    width: 140,
                    child: Image(
                      image: AssetImage('assets/Attend.png'),
                    )),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  labelText: "email",
                  onChanged: (value) {
                    user.value = user.value.copyWith(email: value);
                  },
                  prefixIcon: Icons.email,
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  obscureText: true,
                  labelText: "password",
                  prefixIcon: Icons.key,
                  controller: passwordController,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.value.currentState!.validate()) {
                        ref
                            .read(
                                firebasesignInWithEmailAndPasswordUseCaseProvider)
                            .execute(
                                FirebaseSignInWithEmailAndPasswordUseCaseInput(
                                    email: user.value.email,
                                    password: passwordController.text))
                            .then((value) => value.fold(
                                (l) => ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(l.toString()),
                                    )),
                                (r) => context.router
                                    .replaceAll([const HomeScreen()])));
                      }
                    },
                    color: const Color(0xFF1E4578),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          context.router.push(const RegisterScreen());
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
