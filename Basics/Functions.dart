void printData(String name, int age, {double price = 666.0}){
  print("Name: $name, Age: $age, Price: $price");
}

void main(){
  int a = 10;
  int b = 20;

  printData("Gabriel", 20);
  printData("Gabriel", 20, price:1000.0);

  var HelloWorld = () {
    print("Hello World");
  };
  HelloWorld();
  
  var add = () => a+b;
  print(add());
}