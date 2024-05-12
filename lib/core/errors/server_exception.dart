import 'package:dartz/dartz.dart';
import 'package:kg_sa/core/widgets/flutter_toast.dart';
abstract class Failure {}

// Failures
class UnauthorizedFailure extends Failure {}

class NoNetworkConnectionFailure extends Failure {}

class WalletNoBalanceFailure extends Failure {}

class ServerFailure extends Failure {}

class BadRequestFailure extends Failure{}

class TooManyRequestsFailure extends Failure{}

class AppNeedToUpdateFailure extends Failure{}

class ConflictFailure extends Failure {}


//---------------->Exceptions<------------------------//

class UnauthorizedException implements Exception {}

class ConflictException implements Exception {}

class WalletNoBalanceException implements Exception {}

class NoNetworkConnectionException implements Exception {}

class ServerException implements Exception {}

class TooManyRequestsException implements Exception{}

class AppNeedToUpdateException implements Exception{}

class BadRequestException implements Exception{
  final String message;

  BadRequestException({required this.message});

}









Either<Failure, T> handleException<T>(dynamic exception, StackTrace stackTrace) {
  print('test------------------>working ---------------->');
  switch (exception.runtimeType) {
    case ServerException:
      return Left(ServerFailure());
    case UnauthorizedException:
      return Left(UnauthorizedFailure());
    case NoNetworkConnectionException:
               
      return Left(NoNetworkConnectionFailure());
    case BadRequestException:
    
      return Left(BadRequestFailure());
    case WalletNoBalanceException:
      return Left(WalletNoBalanceFailure());
    case AppNeedToUpdateException:
      return Left(AppNeedToUpdateFailure());
    case TooManyRequestsException:
      return Left(TooManyRequestsFailure());
    default:
      return Left(ServerFailure());
  }
  }

  // String exceptionMasseges (Failure exception){
  //   switch (exception.runtimeType) {
  //   case ServerFailure:
  //     showToast(context, message, color);
  //     return "Server Error case";
  //   case UnauthorizedFailure:
  //   "You need a Premmsions".toastString();
  //     return "You need a Premmsions";
  //   case NoNetworkConnectionFailure:
  //   "No Internet Connection".toastString();
  //     return "No Internet Connection";
  //   case BadRequestFailure:
  //   "Bad Request".toastString();
  //     return "Bad Request";
  //   case WalletNoBalanceFailure:
  //   "Wallet doesn't have enough Balance".toastString();
  //     return "Wallet doesn't have enough Balance";
  //   case AppNeedToUpdateFailure:
  //   "Need to be updated".toastString();
  //     return "Need to be updated";
  //   case TooManyRequestsFailure:
  //   "Too many Requests".toastString();
  //     return "Too many Requests";
  //   default:
  //   "Server Error".toastString();
  //     return "Server Error deafult";
  // }
  // }


// class FetchDataException extends Failure {
//   FetchDataException([String? message]);
// }





// class BadRequestException extends Failure {
//   BadRequestException([message]);
// }

// class UnauthorisedException extends Failure {
//   UnauthorisedException([message]);
// }

// class InvalidInputException extends Failure {
//   InvalidInputException([String? message]);
// }

// class OtherException extends Failure {
//   OtherException([String? message]);
// }
