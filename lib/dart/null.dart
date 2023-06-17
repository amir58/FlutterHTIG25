void main(){
  var object = TestNullable("22");
  print(object.address);
  object.test();
}

class TestNullable {
  // Null safety
  // ? ! ?? ??=

  late int num;
  int? id;
  String name = "";
  String? _address = null;
  String age;

  TestNullable(this.age);

  void test(){
    _address ??= "Cairo";

    print(name.isEmpty);
    print(_address!.isEmpty);
  }

  String get address => _address ?? "No value";

  set address(String value) {
    _address = value;
  }
}
