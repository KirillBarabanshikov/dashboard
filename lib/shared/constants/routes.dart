enum Routes {
  main(path: '/'),
  resetPassword(path: '/reset-password'),
  indicators(path: '/indicators'),
  storeRating(path: '/store-rating'),
  tasks(path: '/tasks'),
  messages(path: '/messages'),
  users(path: '/users'),
  profile(path: '/profile'),
  ;

  const Routes({
    required this.path,
  });

  final String path;

  String get getPath => path;
}
