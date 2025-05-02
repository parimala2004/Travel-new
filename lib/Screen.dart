import 'package:flutter/material.dart';

class listDemo extends StatelessWidget {
  final List<String> categories = ['All', 'Popular', 'New', 'Recommended'];
  final List<String> items = ['Lamp', 'Chair', 'Speaker', 'Sofa', 'Table', 'Mirror', 'Fan', 'Clock', 'AC', 'Heater'];
  final List<String> gridItems = ['Plug', 'Purifier', 'Drone', 'Strip', 'Light', 'Switch'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Smart Home",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold) ,),
        actions: [Icon(Icons.camera_alt_outlined),SizedBox(width: 20,),Icon(Icons.search_outlined,),SizedBox(width: 20,),Icon(Icons.drag_indicator)],

        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- MAP FUNCTION used here ---
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

          // --- LISTVIEW (scrollable container) ---
          Expanded(
            child: ListView(
              children: [
                // --- LISTVIEW.BUILDER for items ---
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(items[index]),
                      subtitle: Text('Details for ${items[index]}'),
                    );
                  },
                ),

                // --- GRIDVIEW.BUILDER for gridItems ---
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: gridItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          gridItems[index],
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
