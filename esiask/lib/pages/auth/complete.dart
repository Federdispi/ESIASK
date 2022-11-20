import 'package:flutter/material.dart';

import '../../controllers/firebase.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  final TextEditingController nameController = TextEditingController();

  final subjects = <String>["GEIPI", "IT", "MDD", "Robotique"];
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
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Compléter le profil'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          alignment: AlignmentDirectional.center,
          child: Column(
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
                height: 40,
              ),
              SizedBox(
                width: 340,
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
              Container(
                width: 340,
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
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
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
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 340,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: DropdownButton(
                  items: years
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => yearValue = value!),
                  value: yearValue,
                  borderRadius: BorderRadius.circular(12),
                  dropdownColor: Colors.blue[600],
                  underline: Container(
                    height: 0,
                  ),
                  elevation: 0,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {


                userSetup(nameController.text.trim(),specialityValue,yearValue,subjectValue);


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
                  "Continuer",
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
