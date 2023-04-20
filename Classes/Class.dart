class Animal{
  String? name;
  String? color;
  String favoriteFood = "";

  Animal(String name){
    this.name = name;
  }
  Animal.favoriteFood(String food){
    this.favoriteFood = food;
  }
  void hunger(){
    print("Hungry!");
  }
  void sound(){
    print("Sound!");
  }
}

class Cat extends Animal{
  Cat(String name) : super(name){
    this.name = name;
  }

  @override
  void sound(){
    print("Meow!");
  }
}
void main(){
  Animal animal = new Animal("Monkey");
  animal.color = "Brown";
  animal.favoriteFood = "Banana";
  print("Color of ${animal.name} is ${animal.color}");
  animal.hunger();
  animal.sound();

  Cat cat = new Cat("Garfield");
  cat.color = "Orange";
  cat.favoriteFood = "Fish";
  print("Color of ${cat.name} is ${cat.color}");
  cat.sound();
}