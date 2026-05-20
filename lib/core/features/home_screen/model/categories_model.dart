import 'dart:convert';

List<String> productsmodelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));
