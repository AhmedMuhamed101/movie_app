import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;

const Failure(this.message);

@override
  List <Object> get props =>[message];
}

class Serverfailure extends Failure {
  const Serverfailure(super.message);
  
}

class DatabaseFailure extends Failure  {
  const DatabaseFailure(super.message);
  
}