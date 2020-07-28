class User {
  int id;
  String name;
  String surname;
  String email;
  int age;
  double salary;
  String gender;
  User(
      {this.id,
      this.name,
      this.surname,
      this.email,
      this.age,
      this.salary,
      this.gender});

  User.fromMap(Map<String, dynamic> obj) {
    id = obj['id'];
    name = obj['name'];
    surname = obj['surname'];
    email = obj['email'];
    age = obj['age'];
    salary = obj['salary'];
    gender = obj['gender'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'age': age,
      'salary': salary,
      'gender': gender,
    };
  }
}
