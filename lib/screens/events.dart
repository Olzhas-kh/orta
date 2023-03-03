import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
    final TextEditingController _searchController = TextEditingController();
   final List<String> sportList = <String> [
    "Football",
    "Volleyball",
    "Chess",
    "Basketball",
    "Tennis",
    "Baseball",
    "Bawling",
    "Golf",
    "Judo",
    "Badminton"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orta App"),
        backgroundColor: (Color.fromARGB(255, 178, 174, 174)),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16,),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  
                },
                controller: _searchController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            const SizedBox(height: 16,),
            SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 55,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(26),
                      color: Color.fromARGB(255, 178, 174, 174)
                    ),
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "${sportList[index]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    
                    
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 15,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 178, 174, 174)
                    ),
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "Card $index",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    
                    
                  ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const[
                          Text("Title"),
                          SizedBox(height: 10),
                          Text("Lorem Ipsum is simply dummy text  "),
                          SizedBox(height: 10),
                          Text("Lorem ipsum dolor sit"),
                        ],
                      ),
                      
                    ],
                  ),
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