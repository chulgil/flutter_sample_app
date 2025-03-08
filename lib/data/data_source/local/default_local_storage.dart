import 'package:flutter_sample_app/domain/data_source/local_storage.dart';

class DefaultLocalStorage implements LocalStorage  {

  var _data = <String, dynamic>{};

  @override
  Future<Map<String, dynamic>> load() async {
    return _data as Map<String, dynamic>;
  }

  @override
  Future<void> save(Map<String, dynamic> json) async {
    _data = json;
  }

}