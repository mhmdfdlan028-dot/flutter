import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,

          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat),
              ),
              Tab(
                icon: Icon(Icons.circle_outlined),
              ),
              Tab(
                icon: Icon(Icons.call),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            // =====================
            // CHAT
            // =====================
            ListView(
              children: [

                Card(
                  elevation: 30,
                  child: ListTile(
                    leading: Icon(
                      Icons.person
                    ),
                    title: Text("Duns"),
                    subtitle: Text(
                      "haii duns juara boxing dunia"
                    ),
                    trailing: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.green
                      ),
                    ),
                  ),
                ),

                Card(
                  elevation: 30,
                  child: ListTile(
                    leading: Icon(
                      Icons.person
                    ),
                    title: Text("Fadlan"),
                    subtitle: Text(
                      "Halo, apa kabar?"
                    ),
                    trailing: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.green
                      ),
                    ),
                  ),
                ),

              ],
            ),

            
  ListView(
    children: [

      // STATUS SAYA
      ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            child: Icon(
              Icons.person,
              size: 35,
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),

      title: Text(
        "My status",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(
        "Tap to add status",
      ),
    ),

    Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "Recent updates",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),

                
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),

                    title: Text(
                      "Duns",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "Today, 16:30",
                    ),
                  ),

                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),

                    title: Text(
                      "Fadlan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "Today, 15:20",
                    ),
                  ),

                ],
              ),
            ListView(
              children: [

                Card(
                  elevation: 30,
                  child: ListTile(
                    leading: Icon(
                      Icons.person
                    ),
                    title: Text("Duns"),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.call_received,
                          color: Colors.green,
                          size: 18,
                        ),
                        Text(" Hari ini, 16:00"),
                      ],
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ),

                Card(
                  elevation: 30,
                  child: ListTile(
                    leading: Icon(
                      Icons.person
                    ),
                    title: Text("Fadlan"),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.call_made,
                          color: Colors.green,
                          size: 18,
                        ),
                        Text(" Kemarin, 20:15"),
                      ],
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}