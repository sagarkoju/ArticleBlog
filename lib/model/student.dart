class Student {
  String name, dob;
  int rollno;

  Student({required this.name, required this.rollno, required this.dob});
}

class Students {
  String name, address;
  int rollno, id;

  Students({
    required this.name,
    required this.rollno,
    required this.address,
    required this.id,
  });
}

class Fruit {
  String name, desc, url;
  int id;
  Fruit({
    required this.name,
    required this.desc,
    required this.url,
    required this.id,
  });
}
