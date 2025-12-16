import 'package:appointment_app/core/networking/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  //Subclass => {Success , Failure}
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler error) = Failure<T>;
}
