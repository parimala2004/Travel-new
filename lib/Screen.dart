import 'package:flutter/material.dart';

  class listDemo extends StatelessWidget {
  final List<String> categories = ['All', 'Popular', 'New', 'Recommended'];
  final List<String> items = ['Lamp','Chair','Speaker','Sofa','Table','Mirror','Fan','Clock','AC','Heater'];
  final List<String> gridItems = ['Plug','purifier','Drone','Strip','Light','Switch'];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text('Smart Home Products',style:TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),)),
  body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  padding: EdgeInsets.all(8),
  child: Row(
  children: categories.map((cat) {
  return Container(
  margin: EdgeInsets.symmetric(horizontal: 8),
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(20),
  ),
  child: Text(cat, style: TextStyle(color: Colors.white)),
  );
  }).toList(),
  ),
  ),


  Expanded(
  child: ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
  return ListTile(
  leading: CircleAvatar(child: Text('${index + 1}'),),
  title: Text(items[index]),
  subtitle: Text('Details for ${items[index]}'),
  );
  },
  ),
  ),
    Wrap(
      spacing: 25,
      runSpacing: 20,
      children: gridItems.map((item) {
        return Container(
          width: MediaQuery.of(context).size.width / 3- 20,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            item,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    ),

  ],
  ),
  );
  }
  }
