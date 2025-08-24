import 'package:flutter/material.dart';

class TabProductDetails extends StatelessWidget {
  const TabProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: "Description"),
              Tab(text: "Specifications"),
              Tab(text: "Reviews"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Description
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
            
                // Specifications
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("• Bluetooth: 5.1"),
                      Text("• Battery life: 30h"),
                      Text("• Weight: 250g"),
                    ],
                  ),
                ),
            
                // Reviews
                ListView(
                  padding: const EdgeInsets.all(12.0),
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Great product!"),
                      subtitle: Text("Really loved the quality."),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Not bad"),
                      subtitle: Text("Good sound but battery drains fast."),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
