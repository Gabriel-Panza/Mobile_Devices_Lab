class Config{
  static final String appId = "App123";
  String deviceId = "Device123";

  static void init(){
    print("Init...");
  }
}

void main(){
  Config.init();
  // Config.appId = "App456"
  print("AppId: ${Config.appId}");
}