import 'package:dio/dio.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_clinic_history.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_clinic_join_request.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_subscribed_clinics.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_lab_history.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_lab_join_request.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_subscribed_labs.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';

import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/services/Cache/cache_helper.dart';
import 'package:lambda_dent_dash/services/dio/dio.dart';

/// Error reported by the backend in its `status: false` envelope.
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class DbManagerRepo implements ManagerRepo {
  /// Backend errors arrive as `error_message`, which is either a string or a
  /// map of validation errors.
  static String _errorMessage(Map data) {
    final message = data['error_message'] ?? data['message'];
    if (message is Map) {
      return message.values
          .expand((v) => v is List ? v : [v])
          .map((v) => v.toString())
          .join('\n');
    }
    return message?.toString() ?? 'Unknown error';
  }

  /// Returns the response body of a list endpoint, or null when the backend
  /// reports "no records" (HTTP 200 with `status: false`, `error_code: 200`).
  Future<Map<String, dynamic>?> _getList(String path) async {
    final data = (await DioHelper.getData(path))?.data;
    if (data is! Map<String, dynamic>) {
      throw ApiException('Unexpected response from $path');
    }
    if (data['status'] == true) return data;
    if (data['error_code'] == 200) return null;
    throw ApiException(_errorMessage(data));
  }

  Future<bool> _isSuccess(Future<Response?> request) async {
    try {
      final data = (await request)?.data;
      if (data is Map && data['status'] == true) return true;
      print(
          "Request failed: ${data is Map ? _errorMessage(data) : 'Unknown error'}");
      return false;
    } catch (error) {
      print('Request failed: $error');
      return false;
    }
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      final response = await DioHelper.postData(
          'login', {'email': email, 'password': password, 'guard': 'admin'});
      final data = response?.data;
      final token = data is Map && data['data'] is Map
          ? data['data']['access_token']
          : null;
      if (data is Map && data['status'] == true && token is String) {
        await CacheHelper.setString('token', 'Bearer $token');
        print('Login successful.');
        return true;
      }
      print(
          "Login failed: ${data is Map ? _errorMessage(data) : 'Unknown error'}");
      return false;
    } catch (error) {
      print('Login failed: $error');
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    final success = await _isSuccess(DioHelper.postData('auth/logout', {}));
    if (success) await CacheHelper.removeString('token');
    return success;
  }

  @override
  Future<bool> confirmlabs(int id) =>
      _isSuccess(DioHelper.updateData('admin/accept-lab-register/$id', {}));

  @override
  Future<bool> confirmclinics(int id) =>
      _isSuccess(DioHelper.updateData('admin/accept-clinic-register/$id', {}));

  @override
  Future<bool> renew(int months, int id) => _isSuccess(DioHelper.postData(
      'admin/renew-subscription', {'subscription_id': id, 'months': months}));

  @override
  Future<List<ClinicDetails>> getHistoryClinics() async {
    final data = await _getList('admin/clinics/null-subscription');
    if (data == null) return [];
    final clinics =
        DBHistoryClinicsResponse.fromJson(data).notSubscribedClinics ?? [];
    return clinics.map((clinic) => clinic.todomain()).toList();
  }

  @override
  Future<List<LabDetails>> getHistoryLabs() async {
    final data = await _getList('admin/labs/null-subscription');
    if (data == null) return [];
    final labs =
        DBHistoryLabsResponse.fromJson(data).subscribedNotSubscribeLabs ?? [];
    return labs.map((lab) => lab.todomain()).toList();
  }

  @override
  Future<List<ClinicDetails>> getSubscribedClinics() async {
    final data = await _getList('admin/subscribed-clinics');
    if (data == null) return [];
    final clinics =
        DBSubscribedClinicsResponse.fromJson(data).subscribedClinics ?? [];
    return clinics.map((clinic) => clinic.todomain()).toList();
  }

  @override
  Future<List<LabDetails>> getSubscribedLabs() async {
    final data = await _getList('admin/subscribed-labs');
    if (data == null) return [];
    final labs = DBSubscribedLabsResponse.fromJson(data).subscribedLabs ?? [];
    return labs.map((lab) => lab.todomain()).toList();
  }

  @override
  Future<List<LabDetails>> getnewLabs() async {
    final data = await _getList('admin/labs-register-requests');
    if (data == null) return [];
    final labs =
        DBLabsJoinRequestResponse.fromJsonReq(data).labsJoinRequest ?? [];
    return labs.map((lab) => lab.todomain()).toList();
  }

  @override
  Future<List<ClinicDetails>> getnewClinics() async {
    final data = await _getList('admin/clinics-register-requests');
    if (data == null) return [];
    final clinics =
        DBClinicJoinRequestResponse.fromJsonReq(data).joinOrdersClinics ?? [];
    return clinics.map((clinic) => clinic.todomain()).toList();
  }
}
