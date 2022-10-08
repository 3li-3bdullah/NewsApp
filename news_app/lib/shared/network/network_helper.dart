class NetworkHelper {
  static Dio dio;

  static initData(){
    dio = Dio(BaseOption(
      url: "https://newsapi.org/",
      receiveDataWhenStatusError: true
    ));
  }
}