// DataType => String , int , double , bool
// DataType functionName (parameters => variables ) { body }
// void functionName (parameters => variables ) { body }
// to show function parameters => ctrl + p
void main() {
  print(getWelcomeMessage());
  print(getWelcomeMessage2("Ali"));
  print(getWelcomeMessage2("Aziz"));
  print(getWelcomeMessage3("Ali", "Ahmed"));
  print(getWelcomeMessage4("Ahmed", "Sayed"));
  print(getWelcomeMessage4("Mohammed"));
  print(getWelcomeMessage5(firstName: "Ali", lastName: "Aziz"));
  print(getWelcomeMessage6(firstName: "Ali"));
  print(getWelcomeMessage7("Ali"));
  print(getWelcomeMessage7("Ali", lastName: "Mohamed"));
  print(getWelcomeMessage8(firstName: "Saied", lastName: "Zaid"));
  print(getWelcomeMessage8(firstName: "Abdo"));
}

String getWelcomeMessage() {
  return "Welcome Mr . Ahmed";
}

String getWelcomeMessage2(String name) {
  return "Welcome Mr . $name";
}

// Default Parameters => required , optional
// Named Parameters  => required , optional

String getWelcomeMessage3(String firstName, String lastName) {
  return "Welcome Mr . $firstName $lastName";
}

String getWelcomeMessage4(String firstName, [String lastName = "!"]) {
  return "Welcome Mr . $firstName $lastName";
}

String getWelcomeMessage5(
    {required String firstName, required String lastName}) {
  return "Welcome Mr . $firstName $lastName";
}

String getWelcomeMessage6({required String firstName, String lastName = ""}) {
  return "Welcome Mr . $firstName $lastName";
}

String getWelcomeMessage7(String firstName, {String lastName = ""}) {
  return "Welcome Mr . $firstName $lastName";
}

String getWelcomeMessage8({required String firstName, String? lastName}) {
  return "Welcome Mr . $firstName $lastName";
}

void printMyData() {
  print('Hello');
  print('Welcome');
}
