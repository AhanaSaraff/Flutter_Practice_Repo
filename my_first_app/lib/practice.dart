import 'dart:io';

void main() {
  print('Welcome to dart');

  // stdout.write("Enter your name");
  // var name = stdin.readLineSync();
  //
  // print('Welcome, $name');
  // var Raman = new Human();
  //
  // int? a;
  // print(a);

  // String name = "Raman";
  // print(name);

  var myClass = new Human();
  myClass.printName("Ahana");
  myClass.printName("Ande");
  myClass.printName("Undo");
  myClass.printName("Saraff");
  myClass.printName("Ahana");

  print(myClass.Add(10, 20));
}

class Human{

  Human(){
    print("Human constructor created!");
  }

  void printName(String name) {
    print(name);
  }

  int Add(int x, int y){
    return x+y;
  }
}