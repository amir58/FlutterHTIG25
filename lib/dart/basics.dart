void main() {
  print("Hello World!");
  print('Hello Flutter');

  // String , int , double , bool
  // DataType variableName = value ;

  String name = 'Amir';
  int age = 20;
  double number = 1.5;
  bool isMarried = true;
  print(name);
  print("Age : $age");
  print("Is Married : $isMarried");

  var name2 = "Ali";

  // filed , packages ( Folders ) => small_letters_with_under_scores
  // Class => ClassName , SelectUserLocationScreen
  // variables , functions => camelCase , getUserLocation
  // letters , underscore, dollar sign

  // Operators
  // + - / * %
  // += -= /= *= %=
  // < > <= >=
  // == !=
  // ++ --
  // ! || &&
  // ? : ( simple if )
  // ! ?? ??=
  // is is!

  double num = 10;

  num = num + 5;
  num += 5;

  num *= 5;

  num /= 2;

  num %= 5;

  print(num);

  print("amir" == "Amir");
  print(10 != 5);

  // ( Condition ) ? true : false
  print(5 > 4 ? "Five" : "Four");

  print(name is String);
  print(age is! bool);

  // if ( condition ) { true } else { false }

  if ("Ahmed" == "AhmeD") {
    print('Valid');
  } else {
    print('NotValid');
  }

  // Requested, Accepted , Rejected , OnTheWay , Finished , Refused, Canceled
  String orderStatus = "Finished";

  if (orderStatus == "Requested") {
    print(orderStatus);
  } else if (orderStatus == "Accepted") {
    print(orderStatus);
  } else if (orderStatus == "Rejected") {
    print(orderStatus);
  } else if (orderStatus == "Finished") {
    print(orderStatus);
  } else {
    print('Order Status Unknown');
  }

  switch (orderStatus) {
    case "Requested":
      {
        print(orderStatus);
      }
      break;
    case "Accepted":
      {
        print(orderStatus);
      }
      break;
    case "Rejected":
      {
        print(orderStatus);
      }
      break;
    case "Finished":
      {
        print(orderStatus);
      }
      break;
    default:
      {
        print('Order Status Unknown');
      }
  }

  if (orderStatus == "Rejected" ||
      orderStatus == "Refused" ||
      orderStatus == "Canceled") {
    print('RED COLOR');
  }

  String rate = "3.5";

  if (orderStatus == "Finished" && rate.isEmpty) {
    print('Show Rate Button');
  } else {
    print('Hide Rate Button');
  }

  for (int i = 0; i <= 10; i++) {
    if (i == 8) {
      break;
    }
    print(i);
    if (i == 5) {
      continue;
    }
    print(i);
  }
  print('--------------------');

  // int i =0 ; i <= 10; i++
  int i = 0;
  while (i >= 5) {
    print(i);
    i++;
  }
  print('--------------------');
  // int x =0 ; x <= 10; x++
  int x = 0;
  do {
    print(x);
    x++;
  } while (x >= 5);

  // Array ( List )
  // var totalNames = ["Ahmed", "Mohamed", "Ali"];
  List<String> totalNames = ["Ahmed", "Mohamed", "Ali"];
  totalNames.add("Mahmoud");

  List<String> groupOneNames = ["Ziad", "Hossam", "Saif", "Abdo", "Ali"];
  print(totalNames.length);

  totalNames.addAll(groupOneNames);

  print(totalNames);

  print(totalNames.length);
  print(totalNames.isEmpty);
  print(totalNames.isNotEmpty);

  print(totalNames[2]);
  print(totalNames.getRange(2, 5));

  print(totalNames.first);
  print(totalNames.last);

  // totalNames = totalNames.reversed.toList();
  // totalNames.clear();

  // totalNames.removeLast();
  // totalNames.remove("Ziad");
  // totalNames.removeAt(3);
  // totalNames.removeRange(1, 3);

  // totalNames.remove("Ali");
  totalNames.removeWhere((element) => element == "Ali");
  // totalNames.removeWhere((name) {
  //   print(name);
  //   return name == "Ali";
  // });

  for (int x = 0; x < totalNames.length; x++) {
    if (totalNames[x] == "Ali") {
      totalNames.removeAt(x);
    }
  }

  for (var name in totalNames) {
    print(name);
  }

  print(totalNames);

  // CRUD Operations => Create , Read (Get) , Update, Delete

  // Strings

  String welcome = "Welcome to flutter course";
  print(welcome.length);
  print(welcome.isEmpty);
  print(welcome.isNotEmpty);
  print(welcome.startsWith("welcome"));
  print(welcome.split(" "));
  print(welcome.toUpperCase());
  print(welcome.toLowerCase());
  print(welcome.contains("flutter"));
  print(welcome.substring(19));

  // iPhone => Iphone

  String date = "2023/06/14";
  print(date.split("/"));
  print("Year : ${date.split("/")[0]}");
  print("Month : ${date.split("/")[1]}");
  print("Day : ${date.split("/")[2]}");

  String dateTime = "2023-06-14 6:27PM";
  var dateTimes = dateTime.split(" ");
  var date2 = dateTimes[0];
  var time2 = dateTimes[1];

  print('Date : $date2');
  print('Time : $time2');

  // Trim , TrimLeft, TrimRight
  String email = " amir@gmail .com ";
  print(email.length);
  email = email.replaceAll(" ", "");
  print(email.length);

  // 01116026522
  // 0111 6036 522
  // +201116026522
  // +20111 6036 522
  // 00201116026522
  // 0020111 6036 522
  // 0020111-6036-522

  String phoneNumber = "0020111 6036 522";
  phoneNumber = phoneNumber.replaceAll(" ", "").replaceAll("-", "");

  if (phoneNumber.startsWith("002")) {
    phoneNumber = phoneNumber.replaceFirst("002", "+2");
  }

  print(phoneNumber);
}
