import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_march23/loginapi.dart';
import 'package:http/http.dart' as http;

class Getapipage extends StatefulWidget {
  const Getapipage({Key? key}) : super(key: key);

  @override
  State<Getapipage> createState() => _GetapipageState();
}

class _GetapipageState extends State<Getapipage> {
  Getapiclass? api;
  bool datafound=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callingapi();
  }
  Future<void> callingapi() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

     print(url);

    var call = jsonDecode(response.body);
    setState(() {
      api = Getapiclass.fromJson(call);
      datafound=true;
      print("==${api!.products!.length}");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Loginapipage();
            },));
          }, child: Text("Jump to Post api",style: TextStyle(fontSize: 22,color: Colors.white),)),
          SizedBox(width: 25,)
        ],
        title: Text("Get Api"),
      ),
      body: datafound?ListView.builder(
        padding: EdgeInsets.all(05),
        itemCount: api!.products?.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("${api!.products![index].title}"),
            subtitle: Text("${api!.products![index].category}"),
            leading: Text("${api!.products![index].price}"),
          ),
        );
      },): Center(child: CircularProgressIndicator(),),
    );
  }
}

//class of api data
class Getapiclass {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  Getapiclass({this.products, this.total, this.skip, this.limit});

  Getapiclass.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  var rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
