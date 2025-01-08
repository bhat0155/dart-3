import "dart:convert";

class Students {
  List<Map<String, dynamic>> people;

  Students(List<Map<String, dynamic>> this.people);

  sort(String fieldName) {
    //sort the List based on the fieldName in each Map.
    //fieldName would be something like 'email' or 'first'

    people.sort((a, b) => a[fieldName].compareTo(b[fieldName]));

    output();
    //after sort call output()
  }

  output() {
    //loop and print each Map object properties and values
    for (var item in people) {
      for (var e in item.entries){
        print("${e.key} - ${e.value}");
      }
    }
  }

  plus(Map<String, dynamic> person) {
    //add a person Map to the people List

    people.add(person);
    output();

    //last step is to call output
  }

  remove(String fieldName) {
    //remove a key-value entry from any Map that contains a property with the name fieldName.
    //Eg: {id: 2, first:'Steve', last:'Griffith', email: 'griffis@algonquincollege.com'}
    // with field="email", remove the "email" property from EACH Map in the LIST

    people.forEach(
        (item) => {item.removeWhere((key, value) => key == fieldName)});

    output();
    //last step is to call output()
  }
}

void main(List<String> arguments) {
  String json = '''
[
  {"id":1, "first":"Leonardo", "last":"DiCaprio", "email":"leo@hollywood.com"},
  {"id":2, "first":"Taylor", "last":"Swift", "email":"taylor@musicworld.com"},
  {"id":3, "first":"Robert", "last":"Downey Jr.", "email":"rdj@avengers.com"},
  {"id":4, "first":"Emma", "last":"Watson", "email":"emma@hogwarts.com"}
]
''';

  var listOfItems = (jsonDecode(json) as List<dynamic>)
      .map((item) => item as Map<String, dynamic>)
      .toList();
  // print(listOfItems);

  Students student = Students(listOfItems);
  student.sort("first");
  print("********************");

  student.plus({
    "id": 5,
    "first": "Ekam",
    "last": "Bhatia",
    "email": "bhat0155@algonquinlive.com"
  });

  print("********************");

  student.remove("first");
}
