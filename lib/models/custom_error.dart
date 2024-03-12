class CustomError {
  const CustomError({
    this.code = '',
    this.msg = '',
    this.plugin = '',
  });

  final String code;
  final String msg;
  final String plugin;

  @override
  String toString() => 'CustomError(code:$code,message:$msg,plugin:$plugin)';
}
