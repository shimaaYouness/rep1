import 'package:flutter/cupertino.dart';
import 'package:untitled/features/water/data/modles/bill_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/entities/briza.dart';
import '../modles/briza_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

abstract class BaseWaterDataSource {
  Future<List<BrizaModel>> getAllBriza();

  Future<List<BillModel>> getWaterBills();

  getBillsByYear(int year);

}

List<BrizaModel> brizaByUser= [];
List<BillModel> bills = [];
List<BillModel> billsByYear= [];

String? staticToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiOTQzNC8xIiwiZXhwIjoxNzAzMDczMjEzLCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.KYIvlbagktWf2p8py_9ybBVG_JK3GQ9uDk1FJbZxO3Y";


class WaterDataSource extends BaseWaterDataSource {
  @override
  Future<List<BrizaModel>> getAllBriza() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = staticToken;
    var response = await http.get(
      Uri.parse(ApiUrls.briza),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      brizaByUser.clear();
      Map<String, dynamic> data =
      convert.jsonDecode(convert.utf8.decode(response.bodyBytes))
      as Map<String, dynamic>;
      data['items'].forEach((element) {
        BrizaModel brizaList = BrizaModel.fromJson(element);
        brizaByUser.add(brizaList);
      });

    }
    return brizaByUser;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    // var response = await http.get(
    //   Uri.parse(ApiUrls.briza),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Accept': 'application/json',
    //     'Authorization': 'Bearer $token',
    //   },
    // );
    // Map<String, dynamic> data =
    // convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
    // if (response.statusCode == 200) {
    //   return List<BrizaModel>.from((data["results"] as List).map(
    //         (e) => BrizaModel.fromJson(e),
    //   ));
    //   //notifyListeners();
    // }

    // else {
    //   print('Else');
    //   throw ServerException(
    //     //errorMessageModel: ErrorMessageModel.fromJson(data),
    //     errorMessageModel: ErrorMessageModel(statusCode: response.statusCode ,statusMessage: "stMessage", success: false),
    //
    //   );
    //}
  }

  @override
  Future<List<BillModel>> getWaterBills() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = staticToken;
    var response = await http.post(Uri.parse(ApiUrls.water),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: convert.jsonEncode(<String, String>{
          'status': 1.toString(),
          'city': 2.toString(),
          'briza': 310170.toString(),
        }));
    if (response.statusCode == 200) {
      bills.clear();
      Map<String, dynamic> data =
      convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      data['items'].forEach((element) {
        BillModel waterBill = BillModel.fromJson(element);
        bills.add(waterBill);
      });
    }
    return bills;
  }

  @override
  getBillsByYear(int year) {
  }
}
