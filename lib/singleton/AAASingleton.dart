class AAASingleton {
  static final AAASingleton _singleton = AAASingleton._internal();
  String name = "Anant";

  factory AAASingleton() {
    return _singleton;
  }

  AAASingleton._internal();
}