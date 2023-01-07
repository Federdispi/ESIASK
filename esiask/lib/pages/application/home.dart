
import 'package:esiask/models/logo.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});


    
Widget buildCard(int index)=>Container(
  color: Colors.red,
  width:100,
  height:150,
  child:Center(child:Text('$index'))
);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Logo(fontSize: 24),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),

      body: ListView.separated(
        scrollDirection: Axis.vertical, 
        padding:const EdgeInsets.all(20), 
        itemCount: 10,
        separatorBuilder: (context,index){
          return const SizedBox(height:20);
        },
      itemBuilder: (context, index) 
      {
        return buildCard(index);  
        },
        
      ),
    );

  }
}
