// Class , Object
// Class => Container ( variables , functions )
// Object => Copy of class

// DataType variableName = value ;
// DataType functionName( parameters => variables ) { body }
// void functionName( parameters => variables ) { body }

// class ClassName { class body => variables , functions }
// ClassName objectName = ClassName();
// var objectName = ClassName();
// final objectName = ClassName();
// const objectName = ClassName();
import 'package:flutter25/dart/person.dart';

void main() {
  // To show parameters => Ctrl + p
  var user1 = User(1,"Ali","011","Cairo");

  User user2 = User(2, "Hossam", "012", "Alex");

  Person person1 = Person(1, "Ali", "20");
  person1.setName("Mahmoud");
  person1.printUserData();
}

class User {
  int id = 0;
  String name = "";
  String phone = "";
  String city = "";

  User(this.id, this.name, this.phone, this.city){
    print('New Object');
    printUserData();
  }

  // Constructor => function => create new object => call
  // Constructor => ClassName
  // Constructor => Has no return data type

  void printUserData() {
    print('User Id : $id');
    print('User Name : $name');
    print('User Phone : $phone');
    print('User City : $city');
  }
}
