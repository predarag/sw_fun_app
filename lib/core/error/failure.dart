import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message}) : super(message);
}
