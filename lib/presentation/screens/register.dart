import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iattened/application/auth/firebase_api/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.input.dart';
import 'package:iattened/application/auth/firebase_api/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.use_case.dart';
import 'package:iattened/domain/models/doctormodel.dart';
import 'package:iattened/presentation/widgets/textfield.dart';
import 'package:iattened/router/app_router.gr.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final user = useState(const DoctorModel());
    final passwordController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF1E4578),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text(
            'I Attend',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: formKey.value,
              child: Column(
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const SizedBox(
                      height: 140,
                      width: 140,
                      child: Image(
                        image: AssetImage('assets/Attend.png'),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomTextField(
                            prefixIcon: Icons.person,
                            onChanged: (value) {
                              user.value = user.value.copyWith(name: value);
                            },
                            labelText: "Full name",
                            validator: RequiredValidator(
                                errorText: "This Field is Required"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.email,
                    onChanged: (value) {
                      user.value = user.value.copyWith(email: value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    validator: MultiValidator([
                      RequiredValidator(errorText: "This Field is Required"),
                      EmailValidator(
                          errorText: "please provide a correct email")
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.key,
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "This Field is Required"),
                      LengthRangeValidator(
                          min: 8,
                          max: 12,
                          errorText:
                              "password should be between 8 and 12 digits")
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.value.currentState!.validate()) {
                          ref
                              .read(
                                  firebasesignUpWithEmailAndPasswordUseCaseProvider)
                              .execute(
                                  FirebaseSignUpWithEmailAndPasswordUseCaseInput(
                                      user: user.value,
                                      password: passwordController.text))
                              .then((value) => value.fold(
                                  (l) => ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(l.toString()))),
                                  (r) => context.router
                                      .replaceAll([const HomeScreen()])));
                        }
                      },
                      color: const Color(0xFF1E4578),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
