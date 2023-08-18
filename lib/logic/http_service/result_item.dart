class ResultItem<T> {
  dynamic message;
  int? errorCode;
  bool? success;
  T result;

  ResultItem({required this.result, this.message = '', this.errorCode, this.success});
}
