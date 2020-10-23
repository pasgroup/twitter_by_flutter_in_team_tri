import 'package:twitter/services/api/api.dart';
import 'package:http/http.dart';

class Product {
  Api api;

  //construct
  Product() {
    api = Api();
  }

  Future<Response> get() async {
    return await api.get('/api/product/list');
  }
}
