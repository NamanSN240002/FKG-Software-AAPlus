import 'package:http/http.dart';
import 'dart:convert';

const String urlendpoint = "http://cd8c-34-16-175-88.ngrok.io";

class GetCategoryProd {
  late String category;
  Map<dynamic, dynamic> ret = {};
  GetCategoryProd({required this.category});
  Future<void> getRecommendation() async {
    Response response = await post(
        // Uri.parse('http://10.0.2.2:5000/'),
        Uri.parse('$urlendpoint/category_prod5'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Content-Type': 'multipart/form-data'
        },
        body: jsonEncode(<String, String>{'category': category}));
    ret = json.decode(response.body);
  }
}

// class GetCategoryList {
//   Map<dynamic, dynamic> ret = {};
//   GetCategoryList();
//   Future<void> getRecommendation() async {
//     Response response = await get(
//         // Uri.parse('http://10.0.2.2:5000/'),
//         Uri.parse('$urlendpoint/category_list'));
//     ret = json.decode(response.body);
//   }
// }

class GetTopRecommendations {
  late String userSsn;
  Map<dynamic, dynamic> ret = {};
  GetTopRecommendations({required this.userSsn});
  Future<void> getRecommendation() async {
    Response response = await post(
        // Uri.parse('http://10.0.2.2:5000/'),
        Uri.parse('$urlendpoint/top_recommendation'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Content-Type': 'multipart/form-data'
        },
        body: jsonEncode(<String, String>{'user_ssn': userSsn}));
    ret = json.decode(response.body);
  }
}

class GetProductRecommendations {
  late String productName;
  Map<dynamic, dynamic> ret = {};
  GetProductRecommendations({required this.productName});
  Future<void> getRecommendation() async {
    Response response = await post(
        // Uri.parse('http://10.0.2.2:5000/'),
        Uri.parse('$urlendpoint/product_recommendations'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"product_name": productName}));
    ret = jsonDecode(response.body);
  }
}

class GetDescriptionRecommendations {
  late String description;
  Map<dynamic, dynamic> ret = {};
  GetDescriptionRecommendations({required this.description});
  Future<void> getRecommendation() async {
    Response response = await post(
        // Uri.parse('http://10.0.2.2:5000/'),
        Uri.parse('$urlendpoint/description_recommendations'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"description": description}));
    ret = jsonDecode(response.body);
  }
}

class LoginApi {
  late String userSsn;
  late String password;
  late Response res;
  LoginApi({required this.userSsn, required this.password});
  Future<void> tryLogin() async {
    Response response = await post(Uri.parse('$urlendpoint/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'ssn': userSsn, 'password': password}));
    res = response;
  }
}

class RegisterApi {
  late String userSsn;
  late String name;
  late String sex;
  late String job;
  late String company;
  late String dob;
  late String password;
  Map<dynamic, dynamic> ret = {};
  RegisterApi(
      {required this.userSsn,
      required this.name,
      required this.sex,
      required this.job,
      required this.company,
      required this.dob,
      required this.password});
  Future<void> tryRegister() async {
    Response response = await post(
        // Uri.parse('http://10.0.2.2:5000/'),
        Uri.parse('$urlendpoint/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "ssn": userSsn,
          "name": name,
          "sex": sex,
          "company": company,
          "job": job,
          "dob": dob,
          "password": password
        }));
    ret = jsonDecode(response.body);
  }
}

// void main() async {
//   LoginApi loginApi = LoginApi(userSsn: "userSsn", password: "password");
//   await loginApi.tryLogin();
//   // print(loginApi.ret["Status"]);
// }
