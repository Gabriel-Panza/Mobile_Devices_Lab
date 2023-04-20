abstract class Person{
  String name = "";
  int age = 0;

  void walk(){
    print("Walking...");
  }
}

abstract class Professor{
  void teach(){
    print("Teaching...");
  }
}

class Pedro extends Person implements Professor{
  void teach(){
    print("Learning how to teach...");
  }
}

void main(){
  Pedro pedro = new Pedro();
  pedro.name = "Pedro";
  pedro.age = 20;
  pedro.walk();
  pedro.teach();
}