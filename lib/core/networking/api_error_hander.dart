import 'package:appointment_app/core/networking/api_constants.dart';
import 'package:appointment_app/core/networking/api_error_model.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: ApiErrors.timeoutError, code: 408);

        case DioExceptionType.badResponse:
          return _handleBadResponse(error);

        case DioExceptionType.connectionError:
          return ApiErrorModel(message: ApiErrors.noInternetError, code: 0);

        case DioExceptionType.cancel:
          return ApiErrorModel(message: ApiErrors.defaultError, code: 0);

        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: ApiErrors.defaultError, code: 0);

        case DioExceptionType.unknown:
          return ApiErrorModel(message: ApiErrors.unknownError, code: 0);

        default:
          return ApiErrorModel(message: ApiErrors.defaultError, code: 0);
      }
    }

    return ApiErrorModel(message: ApiErrors.unknownError, code: 0);
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    final response = error.response;

    // Try to parse API error response
    if (response?.data != null) {
      try {
        final data = response!.data;
        if (data is Map<String, dynamic>) {
          // Check if response has the expected format
          if (data['message'] != null && data['code'] != null) {
            return ApiErrorModel.fromJson(data);
          }
          // If only message exists
          if (data['message'] != null) {
            return ApiErrorModel(
              message: data['message'].toString(),
              code: response.statusCode ?? 0,
            );
          }
        }
      } catch (e) {
        // Continue to status code handling
      }
    }

    // Handle by status code
    return _handleStatusCode(response?.statusCode);
  }

  static ApiErrorModel _handleStatusCode(int? statusCode) {
    if (statusCode == null) {
      return ApiErrorModel(message: ApiErrors.defaultError, code: 0);
    }

    switch (statusCode) {
      case 400:
        return ApiErrorModel(
          message: ApiErrors.badRequestError,
          code: statusCode,
        );

      case 401:
        return ApiErrorModel(
          message: ApiErrors.unauthorizedError,
          code: statusCode,
        );

      case 403:
        return ApiErrorModel(
          message: ApiErrors.forbiddenError,
          code: statusCode,
        );

      case 404:
        return ApiErrorModel(
          message: ApiErrors.notFoundError,
          code: statusCode,
        );

      case 409:
        return ApiErrorModel(
          message: ApiErrors.conflictError,
          code: statusCode,
        );

      case 204:
        return ApiErrorModel(message: ApiErrors.noContent, code: statusCode);

      case 500:
      case 502:
      case 503:
      case 504:
        return ApiErrorModel(
          message: ApiErrors.internalServerError,
          code: statusCode,
        );

      default:
        return ApiErrorModel(message: ApiErrors.defaultError, code: statusCode);
    }
  }
}
