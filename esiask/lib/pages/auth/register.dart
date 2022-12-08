import 'package:esiask/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Nouveau compte"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 340,
                    child: TextFormField(
                      controller: emailController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Ce champ est requis'),
                        EmailValidator(errorText: "L'email doit être valide")
                      ]),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 340,
                    child: TextFormField(
                      controller: passwordController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Ce champ est requis'),
                        MinLengthValidator(8,
                            errorText:
                                'Le mot de passe doit contenir 8 lettres'),
                        PatternValidator(r'[0-9]',
                            errorText:
                                'Le mot de passe doit contenir au moins un chiffre')
                      ]),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => setState(
                              () => obscurePassword = !obscurePassword),
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        registerWithEmailAndPassword(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: const Size(340, 55),
                    ),
                    child: const Text(
                      "Créer le compte",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Divider(
                        thickness: 2,
                        indent: 35,
                        endIndent: 35,
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          'ou',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(150, 90),
                        ),
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          fit: BoxFit.cover,
                          width: 50,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          fixedSize: const Size(150, 90),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          Icons.facebook,
                          size: 45,
                        ),
                      ),
                    ],
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
