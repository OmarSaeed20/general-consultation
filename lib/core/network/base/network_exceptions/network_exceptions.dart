import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:general_consultation/core/functions/error_400.dart';
import '/core/routes/app_pages.dart';
import '/core/util/app_prefs.dart';
// import '/sl.dart';
import 'package:get/get.dart' as getx;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@Freezed()
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
      UnauthorizedRequest;
  // const factory NetworkExceptions.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  // const factory NetworkExceptions.notFound(String reason) = NotFound;
  const factory NetworkExceptions.notFound() = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    List<String> errors = [];
    if ((response?.data as Map<String, dynamic>).containsKey("errors")) {
      (response?.data["errors"] as Map<String, dynamic>)
          .forEach((key, value) => errors.add("${value.first}\n"));
    } else {
      errors.add(response?.data["message"]);
    }

    String error = errors
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "")
        .trim();
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        if (getx.Get.currentRoute.contains(Routes.login) ||
            getx.Get.currentRoute.contains(Routes.verifyCode) ||
            getx.Get.currentRoute.contains(Routes.serviceDetails) ||
            getx.Get.currentRoute.contains(Routes.createAds)) {
          return NetworkExceptions.unauthorizedRequest(error);
        } else {
          getx.Get.find<AppPreferences>().logout();
          getx.Get.offNamedUntil(Routes.login, (route) => false);
          return NetworkExceptions.unauthorizedRequest(error);
        }
      case 404:
        return const NetworkExceptions.notFound();
      case 409:
        return const NetworkExceptions.conflict();
      case 408:
        return const NetworkExceptions.requestTimeout();
      case 422:
        return NetworkExceptions.unprocessableEntity(error);
      case 500:
        return const NetworkExceptions.internalServerError();
      case 503:
        return const NetworkExceptions.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      notImplemented: () => errorMessage = "notImplemented".tr,
      requestCancelled: () => errorMessage = "requestCancelled".tr,
      internalServerError: () => errorMessage = "internalServerError".tr,
      // notFound: (String error) => errorMessage = error;.tr,
      notFound: () => errorMessage = "notFound".tr,
      serviceUnavailable: () => errorMessage = "serviceUnavailable".tr,
      methodNotAllowed: () => errorMessage = "methodNotAllowed".tr,
      badRequest: () => errorMessage = "badRequest".tr,
      unauthorizedRequest: (String reason) => errorMessage = reason.tr,
      // unauthorizedRequest: () => errorMessage = "Unauthenticated.".tr,
      unprocessableEntity: (String error) => errorMessage = error,
      unexpectedError: () => errorMessage = "unexpectedError".tr,
      requestTimeout: () => errorMessage = "requestTimeout".tr,
      noInternetConnection: () => errorMessage = "noInternetConnection".tr,
      conflict: () => errorMessage = "conflict".tr,
      sendTimeout: () => errorMessage = "sendTimeout".tr,
      unableToProcess: () => errorMessage = "unableToProcess".tr,
      defaultError: (String error) => errorMessage = error,
      formatException: () => errorMessage = "formatException".tr,
      notAcceptable: () => errorMessage = "notAcceptable".tr,
    );
    return errorMessage;
  }
}
