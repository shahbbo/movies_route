abstract class Failure {
  final String message ;

  Failure({required this.message});
}

class ApiFailure extends Failure{
  ApiFailure({required super.message});
}
class NoInternetFailure extends Failure{
  NoInternetFailure({required super.message});
}