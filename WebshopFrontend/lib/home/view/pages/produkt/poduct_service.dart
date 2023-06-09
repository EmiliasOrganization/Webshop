import 'dart:convert';
import 'package:decimal/decimal.dart';
import 'package:flutterfrontend/home/view/pages/shop/operators/product_summary_dto.dart';
import 'package:http/http.dart' as http;
import '../../../../../constats.dart';


Future<ProductSummary> fetchProduct(String id) async {

  http.Response response;

  response = await http.get(Uri.parse('$shopApi/productSummary/$id'));
  if (response.statusCode == 200) {
    final dynamic json = jsonDecode(response.body);
    return ProductSummary(
          name: json['name'],
          description: json['description'],
          id: json['id'],
          category: json['category'],
          subCategory: json['subCategory'],
          price: Decimal.parse(json['price']),
        );
  } else {
    throw Exception('Failed to fetch products${response.statusCode}');
  }
}

Future<int>imageCount(String id) async {
  http.Response response;

  response = await http.get(Uri.parse('$shopApi/picture/count/$id'));
  if (response.statusCode == 200) {
    final dynamic count = response.body;
    return int.parse(count);
  } else {
    throw Exception('No count!');
  }
}
