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

  void _navigateToNewPage() async {
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
          Opacity(
            opacity: 0.2,
            child: Text(
                'You must enter at least 3 names and ages to proceed to the next page.'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 227, 144),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(person.name),
                    subtitle: Text('${person.age} years old.'),
                  ),
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
        backgroundColor: const Color.fromARGB(255, 162, 123, 228),
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
                title: Text(
                    "Here are 20 qualities you need to be a good computer engineer:"),
              ),
              ListTile(
                title: Text("Strong problem-solving skills:"),
                subtitle: Text(
                    "Computer engineers are constantly faced with complex problems to solve. To be successful, you need to be able to think critically and creatively to come up with solutions."),
              ),
              ListTile(
                title: Text("Excellent analytical and research skills:"),
                subtitle: Text(
                    "Computer engineers need to be able to analyze data and research new technologies to stay up-to-date on the latest trends."),
              ),
              ListTile(
                title: Text("Strong teamwork skills:"),
                subtitle: Text(
                    "Computer engineering is often a collaborative effort, so you need to be able to work effectively with others."),
              ),
              ListTile(
                title: Text("Attention to detail:"),
                subtitle: Text(
                    "Computer engineers need to be able to pay attention to detail to ensure that their work is accurate and error-free."),
              ),
              ListTile(
                title: Text("Ability to learn new things quickly:"),
                subtitle: Text(
                    "The field of computer science is constantly evolving, so you need to be able to learn new things quickly to stay ahead of the curve."),
              ),
              ListTile(
                title: Text("Ability to think creatively:"),
                subtitle: Text(
                    "Computer engineers need to be able to think creatively to come up with new solutions."),
              ),
              ListTile(
                title: Text("Ability to meet deadlines:"),
                subtitle: Text(
                    "Computer engineers often have to meet deadlines, so you need to be able to prioritize your work and meet deadlines consistently."),
              ),
              ListTile(
                title: Text("Ability to work well under pressure:"),
                subtitle: Text(
                    "Computer engineers often work under tight deadlines, so you need to be able to handle stress and work efficiently under pressure."),
              ),
              ListTile(
                title: Text("Ability to follow instructions:"),
                subtitle: Text(
                    "Computer engineers often need to follow instructions, so you need to be able to follow directions and complete tasks as instructed."),
              ),
              ListTile(
                title: Text("Ability to be a lifelong learner:"),
                subtitle: Text(
                    "The field of computer science is constantly evolving, so you need to be willing to learn new things throughout your career."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
