// Encapsulation => private variable , public functions
// private => start name with _
// Named constructor => secondery constructor

class Person {
  int? _id;

  String? _name;

  String? _age;

  Person(this._id, this._name, this._age);

  Person.basic(this._id, this._name);

  Person.named({required int id, required String name}) {
    _id = id;
    _name = name;
  }

  void printUserData() {
    print('Person Id : $_id');
    print('Person Name : $_name');
    print('Person Age : $_age');
  }

  String getName() {
    return _name ?? "";
  }

  void setName(String name) {
    if (name.length < 2) {
      print('Invalid name!');
      return;
    }
    _name = name;
  }

  String? getName2() => _name;

  void setName2(String name) => _name = name;

  String get name => _name ?? "";

  set name(String value) {
    _name = value;
  }

  set name2(String value) => _name = value;
}
