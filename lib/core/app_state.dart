sealed class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class DataState<T> extends AppState {
  DataState({required this.value});
  final T value;
}

class RouteState<T> extends AppState {
  RouteState({this.args});
  final T? args;
}

class EmptyState extends AppState {
  EmptyState({this.message});
  final String? message;
}

class ErrorState<T> extends AppState {
  ErrorState({this.message});
  final T? message;
}
