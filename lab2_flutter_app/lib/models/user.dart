class User {
  final String name;
  final String surname;

  User({required this.name, required this.surname});

  static List<User> users = <User>[
    User(name: "Jan", surname: "Kowalski"),
    User(name: "Ryszard", surname: "Nowak"),
    User(name: "Krystian", surname: "Petek"),
  ];
}
