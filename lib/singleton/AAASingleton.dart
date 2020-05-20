class AAASingleton {
  static final AAASingleton _singleton = AAASingleton._internal();
  String home = "Welcome";
  final shipperAddress={
    'address_id',
  };

  factory AAASingleton() {
    return _singleton;
  }

  AAASingleton._internal();
}
