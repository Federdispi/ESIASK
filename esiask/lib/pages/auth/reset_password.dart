import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Réinitialisation du Mot de Passe")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Vous allez recevoir un mail pour réinitialiser votre mot de passe',
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
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
<<<<<<< Updated upstream
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
=======
              cursorColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () =>
                  resetPassword(emailController.text.trim()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
>>>>>>> Stashed changes
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelStyle: TextStyle(color: Colors.white),
            ),
            cursorColor: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {




              
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
              "Envoyer",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
