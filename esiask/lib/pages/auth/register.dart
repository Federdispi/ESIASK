import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  final subjects = <String>["GEIPI", "IT", "MDD", "Robotique", "AGROSUP"];
  String subjectValue = "GEIPI";
  final years = <String>[
    "1ère année",
    "2ème année",
    "3ème année",
    "4ème année",
    "5ème année",
    "OG"
  ];
  String yearValue = "1ère année";
  final specialities = <String, List>{
    "GEIPI": ["Aucune"],
    "IT": ["Aucune", "ILC", "SE", "SQR"],
    "MDD": ["Aucune"],
    "Robotique": ["Aucune"],
    "AGROSUP": ["Aucune"],
  };
  String specialityValue = "Aucune";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {},
                child: const CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: Icon(
                        Icons.person_add_alt_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: "Nom",
                    prefixIcon: Icon(
                      Icons.person_outline,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: passwordController,
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
                      onPressed: () =>
                          setState(() => obscurePassword = !obscurePassword),
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: DropdownButton(
                    items: subjects
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      if (value != subjectValue) {
                        specialityValue = "Aucune";
                      }
                      subjectValue = value!;
                    }),
                    value: subjectValue,
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: Colors.blue[600],
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 0,
                    isExpanded: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: DropdownButton(
                    items: specialities[subjectValue]!
                        .toList()
                        .map((e) => DropdownMenuItem(
                              value: e.toString(),
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => specialityValue = value!),
                    value: specialityValue,
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: Colors.blue[600],
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 0,
                    isExpanded: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: DropdownButton(
                    items: subjects
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() => subjectValue = value!),
                    value: subjectValue,
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: Colors.blue[600],
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 0,
                    isExpanded: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                ),
                child: const Text(
                  "Créer le compte",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
