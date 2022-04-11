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

class Food {
  String name, desc, url;
  Food({
    required this.name,
    required this.desc,
    required this.url,
  });
}
