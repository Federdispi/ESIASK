import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: SizedBox(
          width: 340,
          height: 40,
          child: TextField(
            controller: searchController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              labelText: "Chercher",
              prefixIcon: Icon(
                Icons.search_outlined,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: ListView(),
      ),
    );
  }
}
