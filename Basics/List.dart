void main(){
  List<String> letters = ["a","b","c"];
  print(letters);
  letters.add("d");
  print(letters);
  letters.remove("d");
  print(letters);

  for (String letter in letters){
    print(letter);
  }

  Map<String,String> states = Map();
  states["RJ"] = "Rio de Janeiro";
  states["SP"] = "São Paulo";
  print(states);

  states.forEach((key, value) {
    print("Symbol: $key, Name: $value");
  });
}