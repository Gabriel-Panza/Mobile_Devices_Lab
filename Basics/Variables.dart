void main(){
  // Declarations
  String name = "Gabriel";
  int age = 12;
  double price = 50.5;
  bool isAdult = true;

  dynamic data = 10;
  print(data);
  data = "Class 2";
  print(data);
  var data2 = 10;
  print(data2);
  // data2 = "Student" will give an error

  print("Name: " + name + ", Age: " + age.toString() + ", Price: " + price.toString());
  print("Name: $name, Age: $age, Adult: $isAdult, Price: $price");  
}