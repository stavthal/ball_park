import 'package:ball_park/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBlack,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40, // Set a specific height for the search bar
              child: TextField(
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rectangular circle shape
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[800],
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Active groups (2)',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildGroupItem('Dream team 🌟', 'Mike: Just do it!', '2d ago'),
            _buildGroupItem('Dream team 🌟', 'You: Almost', '2d ago'),
            const SizedBox(height: 16),
            Text(
              'Contacts (3)',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildContactItem('Alex', 'Done 👍', '12m ago'),
            _buildContactItem('Alex', 'Done 👍', '12m ago'),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            if (kDebugMode) {
              print("Floating Action Button Pressed");
            }
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.add,
            color: customBlack,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildGroupItem(String title, String subtitle, String time) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(Icons.group, color: Colors.white),
        ),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildContactItem(String name, String status, String time) {
    return Card(
      color: Colors.grey[850],
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[800],
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: TextStyle(color: Colors.white)),
        subtitle: Text(status, style: TextStyle(color: Colors.grey)),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
