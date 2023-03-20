

import 'dart:convert';

import 'package:dental_on_track/modules/finance/all_expenses_response_model.dart';
import 'package:dental_on_track/modules/finance/safe_model.dart';
import 'package:dental_on_track/modules/finance/secretary/all_receipts/all_receipts_model.dart';

import '../../config/config.dart';
import 'all_receipt_response_model.dart';
import 'financial_dashboard_model.dart';
import 'secretary/all_expenses/all_expenses_model.dart';

class FinanceService{
  Future<List<Receiptt>> getSafeIncome(String safeName) async {
    var url = Config.publicDomainAddress +
        '/Financial/Receipt/getBySafe/safe1';
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<Receiptt> jsonResponse = receiptFromJson(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
  Future<List<Expenses>> getSafeExpenses(String safeName) async {
    var url = Config.publicDomainAddress +
    '/Financial/expense/getBySafe/safe1'
        ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<Expenses> jsonResponse = expensesFromJson(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
  Future<Safe> getSafeName(String safeName) async {
    var url = Config.publicDomainAddress +
    '/Financial/getSafeName/safe1'
        ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Safe jsonResponse = safeFromJson(response.body);
      return jsonResponse;
    } else {
      return Safe();
    }
  }
  Future<bool> addExpense(double price,String details) async {
    var url = Config.publicDomainAddress +
    '/Financial/expenses/add'
        ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };
    var body=jsonEncode({
      "daoUserName":Config.user.username,
      "date":DateTime.now().toIso8601String(),
      "totalPrice":price,
      "details":details,
      "safeName":"safe1",
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers,body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200||response.statusCode==202) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> closeAccount(int id) async {
    var url = Config.publicDomainAddress +
    '/Financial/transaction/add/$id'
        ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var body=jsonEncode({
      "details":""
    });

    var response = await Config.client.post(Uri.parse(url), headers: headers,body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200||response.statusCode==202) {
      return true;
    } else {
      return false;
    }
  }


  // for owner
  Future<FinancialDashboard> getDashboard() async {
    var url = Config.publicDomainAddress +
        '/Financial/Dashboard'
    ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      FinancialDashboard jsonResponse = FinancialDashboard.fromJson(response.body);
      return jsonResponse;
    } else {
      return FinancialDashboard(
        allExpenses: 0.0,
        allRevenue: 0.0,
        allUnpaid: 0.0,
      );
    }
  }
  Future<List<AllSafesResponse>> getAllSafes() async {
    var url = Config.publicDomainAddress +
        '/Financial/AllSafes'
    ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = List<AllSafesResponse>.from(jsonDecode(response.body).map((x) => AllSafesResponse.fromMap(x) ) ) ;
      return jsonResponse;
    } else {
      return [];
    }
  }
  Future<List<AllReceiptsResponse>> getAllReceipts() async {
    var url = Config.publicDomainAddress +
        '/Financial/Receipt/getAllReceipt'
    ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = List<AllReceiptsResponse>.from(jsonDecode(response.body).map((x) => AllReceiptsResponse.fromMap(x) ) ) ;
      return jsonResponse;
    } else {
      return [];
    }
  }
  Future<List<AllExpensesResponse>> getAllExpenses(DateTime start , DateTime end) async {
    var url = Config.publicDomainAddress +
        '/Financial/expense/getByDateRange'
    ;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-type': 'application/x-www-form-urlencoded;charset=utf-8',
      'Authorization':
      'Bearer ${Config.token}'
    };


    var response = await Config.client.post(Uri.parse(url), headers: headers, body: {
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = List<AllExpensesResponse>.from(jsonDecode(response.body).map((x) => AllExpensesResponse.fromMap(x) ) ) ;
      return jsonResponse;
    }
    else {
      return [];
    }
  }
}