import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CounterRepository {
  FlutterSecureStorage _storage = FlutterSecureStorage();

  static final CounterRepository _repository = CounterRepository._internal();

  factory CounterRepository() {
    return _repository;
  }

  CounterRepository._internal();

  int _count = 0;

  int get count => _count ?? readData();

  void init() async {
    this._count = await readData();
  }

  Future<int> readData() async {
    String data = await _storage.read(key: 'swipe_count');
    return int.parse(data ?? '0');
  }

  Future writeData() async {
    await _storage.write(key: 'swipe_count', value: _count.toString());
  }

  void increment() {
    this._count++;
    this.writeData();
  }

  void decrement() {
    if (this._count > 0) this._count--;
    this.writeData();
  }

  void reset() {
    this._count = 0;
    this.writeData();
  }
}
