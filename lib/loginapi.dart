import 'package:flutter/material.dart';
import 'package:flutter_test_march23/getapi.dart';
import 'package:flutter_test_march23/postapi.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Loginapipage extends StatefulWidget {
  const Loginapipage({Key? key}) : super(key: key);

  @override
  State<Loginapipage> createState() => _LoginapipageState();
}

class _LoginapipageState extends State<Loginapipage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  Postapi? api;
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post api"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Getapipage();
            },));
          }, child: Text("Jump to Get api",style: TextStyle(fontSize: 22,color: Colors.white),)),
          SizedBox(width: 25,)
        ],),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: mobile,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "mobile"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: password,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "password"),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {

              setState(() {
                mobile.text="7276465975";
                password.text="123";
              });

          }, child: Text("insert data")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {

            Map<String,String> mymap={"mobile":"${mobile.text}","password":"${password.text}"};
            final dio = Dio();
            final response = await dio.post('https://parcel.cscodetech.com/de_api/dboy_login.php',data: mymap);
            print(response.data);
            var dcode = jsonDecode(response.data);
            api = Postapi.fromJson(dcode);
            print("====api=$api");
            if(api!.responseCode=="200" && api!.result=="true"){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Postapipage(api!);
              },));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data not matching!")));
            }
          }, child: Text("Login")),

        ],
      ),
    ),
    );
  }
}

class Postapi {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  Postapi(
      {this.dboydata,
        this.currency,
        this.responseCode,
        this.result,
        this.responseMsg});

  Postapi.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }

  @override
  String toString() {
    return 'Postapi{dboydata: $dboydata, currency: $currency, responseCode: $responseCode, result: $result, responseMsg: $responseMsg}';
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
        this.title,
        this.rimg,
        this.status,
        this.rate,
        this.lcode,
        this.fullAddress,
        this.pincode,
        this.landmark,
        this.commission,
        this.bankName,
        this.ifsc,
        this.receiptName,
        this.accNumber,
        this.paypalId,
        this.upiId,
        this.email,
        this.password,
        this.rstatus,
        this.mobile,
        this.accept,
        this.reject,
        this.complete,
        this.dzone,
        this.vehiid,
        this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }

}