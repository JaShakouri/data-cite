abstract class UseCase<T, P> {
  Future<T> call(P param, {int? pageSize, int? pageIndex});
}
