void main(){
  int n1 = 100, n2 = 50;
  var operstion = "add"
  // Switch
  switch(operation){
    case "add":
      print("Add: ${n1+n2}");
      break;
    case "sub":
      print("Sub: ${n1-n2}");
      break;
    case "mult":
      print("Mult: ${n1*n2}");
      break;
    case "div":
      print("Div: ${n1/n2}");
      break;
    default:
      print("Invalid operation!");
  }
}