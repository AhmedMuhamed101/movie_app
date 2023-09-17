import 'package:equatable/equatable.dart';

class ErrorMessageModle extends Equatable{

 final int statusCode ;
 final String statusMessage;
 final bool success;

  const ErrorMessageModle({
    required this.statusCode,
    required this.statusMessage,
    required this.success});
    
factory ErrorMessageModle.fromJson(Map<String , dynamic>json){
return ErrorMessageModle(
  statusCode: json["status_code"],
  statusMessage: json["status_message"],
  success: json["success"],
  );
}

      @override
      List<Object?> get props => [statusCode , statusMessage , success];
}