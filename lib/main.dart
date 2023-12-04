import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person List App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> people = [];
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void _addPerson() {
    final name = nameController.text;
    final age = ageController.text;

    if (name.isEmpty || age.isEmpty || !isNumeric(age)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid name and age.'),
        ),
      );
    } else {
      setState(() {
        people.add(Person(name: name, age: int.parse(age)));
        nameController.clear();
        ageController.clear();
      });
    }
  }

  bool isNumeric(String value) {
    return value != null && int.tryParse(value) != null;
  }

  void _navigateToNewPage() {
    if (people.length >= 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPage(people: people)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Add at least 3 people.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _addPerson,
            child: Text('Add'),
          ),
          ElevatedButton(
            onPressed: _navigateToNewPage,
            child: Text('Navigate to New Page'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text('${person.age} years old.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final List<Person> people;

  const NewPage({required this.people});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(2),
          elevation: 3,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image(image: AssetImage('lib/images/image1.jpg')),
              ),
              ListTile(
                title: Text("Features"),
              ),
              ListTile(
                title: Text("Feature 1"),
                subtitle: Text("Description for Feature 1"),
              ),
              ListTile(
                title: Text("Feature 2"),
                subtitle: Text("Description for Feature 2"),
              ),
              ListTile(
                title: Text("Feature 3"),
                subtitle: Text("Description for Feature 3"),
              ),
              ListTile(
                title: Text("Feature 4"),
                subtitle: Text("Description for Feature 4"),
              ),
              ListTile(
                title: Text("Feature 5"),
                subtitle: Text("Description for Feature 5"),
              ),
              ListTile(
                title: Text("Feature 6"),
                subtitle: Text("Description for Feature 6"),
              ),
              ListTile(
                title: Text("Feature 7"),
                subtitle: Text("Description for Feature 7"),
              ),
              ListTile(
                title: Text("Feature 8"),
                subtitle: Text("Description for Feature 8"),
              ),
              ListTile(
                title: Text("Feature 9"),
                subtitle: Text("Description for Feature 9"),
              ),
              ListTile(
                title: Text("Feature 10"),
                subtitle: Text("Description for Feature 10"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
