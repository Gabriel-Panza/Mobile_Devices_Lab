class Account{
  double money = 0.0;


  double get getMoney{
    if (money > 100)
      return money;
    return 0.0;
  }
  void set setMoney(double money){
    if (money > 100)
      this.money = money*0.99;
    else
      this.money = money;
  }  
}

void main() {
  Account ac = new Account();
  print("Money: ${ac.getMoney}");
  ac.setMoney = 1000.0;
  print("Money: ${ac.getMoney}");
}