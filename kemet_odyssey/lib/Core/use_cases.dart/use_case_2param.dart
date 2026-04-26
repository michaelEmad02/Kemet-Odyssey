abstract class UseCase<T, Param> {
  Future<T> execute([Param param1, Param param2]);
}
