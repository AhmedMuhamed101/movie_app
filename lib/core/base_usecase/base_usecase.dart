import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';

abstract class BaseUseCase<T , Parameters> {
  
Future<Either<Failure , T>> call(Parameters parameters);  
}

class NoParameter extends Equatable{
 const NoParameter();
 
  @override
  List<Object?> get props => [];
  
}