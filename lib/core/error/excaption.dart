import 'package:movie_app/core/network/error_message_model.dart';

class ServerException implements  Exception{
  final ErrorMessageModle errorMessageModle ;

  const ServerException({
    required this.errorMessageModle
}); 

} 

class LocalDatabaseExexption implements Exception {
  final String message;

  LocalDatabaseExexption(this.message);
}